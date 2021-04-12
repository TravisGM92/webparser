# Web Page / Research Paper Parser
A data mining project to extract information from web pages and research articles.

## Phase 1 - Extract Data from Web Page
There are 3 groups that will be extracted:
<ul>
    <li>Product Title</li>
    <li>Categories</li>
    <li>Description</li>
</ul>

The bigger picture is to build a mobile app that extracts the information from bulk supplements
and various research articles to provide a frame like so:

```buildoutcfg
    CREATINE MONOHYDRATE

    <picture of compound>

    <categories as colorful buttons which will (if clicked) list other items under the same cat.>
    [muscle mass][weight gainer][anaerobic strength][nootropic]

    What is Creatine Monohydrate?

    Creatine monohydrate is an organic compound that helps facilitate recycling of ATP
    in muscle and brain tissue and is found in vertebrates. It was first discovered in
    1832 by Michel Eugéne Chevreul, and the first evidence of its benefits on the
    muscles was found in 1912 by Harvard University researchers. Creatine became
    available as a dietary supplement in 1993, and since then it has become one of the
    most widely studied supplements. Creatine is commonly taken by athletes and
    bodybuilders and has become a staple of workout supplements.

    Creatine Monohydrate Benefits

    Creatine monohydrate may promote anaerobic strength and weight gain and help
    increase muscle size. Creatine may also help with cognitive function and support
    the brain.

    - Contribute to increased muscle mass [1]
    - Promote weight gain [2]
    - Help boost anaerobic strength [3][4]
    - Support the brain and cognitive function [3][5]
```

### Conditional Categories
Bulk doesn't have the categories listed out for us so we will be determining the categories.
If a category has increased by 1 then it will be listed in the category section as a button.

During your data extraction and database storage, if the benefit has the key phrase:
<ul>
    <li>"Increased Muscle Mass" and / or "muscle mass" (+1 to Muscle Mass)</li>
    <li>"Weight Gain" (+1 to Weight Gain)</li>
    <li>"Anaerobic Strength" (+1 to Anaerobic Strength)</li>
    <li>Has "Brain" and/or "Cognitive" and/or "Focus" and/or "Mental" and/or "Memory" and/or "Nootropic" (+1 to Nootropic)</li>
    <li>"Energy" (+1 Energy)</li>
    <li>"Endurance" (+1 Endurance)</li>
    <li>"Exercise Performance" or "Performance" (+1 Exercise Performance)</li>
    <li>"Overall Health" or "Overall Wellness" (+1 Overall Health)</li>
    <li>"Antioxidant" (+1 Antioxidant)</li>
    <li>"Digestive" and/or "Fiber" (+1 Digestive Health)</li>
    <li>"Heart" and/or "Cardiovascular" (+1 Heart Health)</li>
    <li>"Hair" (+1 Hair Health)</li>
    <li>"Skin" (+1 Skin Health)</li>
    <li>"Immune" and / or "Immunity" (+1 Immunity Boost)</li>
    <li>"Healthy Weight" (+1 Weight Maintenance)</li>
    <li>"Circulatory System" and / or "Nitric Oxide" (+1 Blood Flow)</li>
    <li>"Mood Support" (+1 Mood)</li>
    <li>"Increase Appetite" (+1 Appetite Increaser)</li>
    <li>"Metabolism" and/or "Metabolic" (+1 Metabolism)</li>
    <li>"Sexual" (+1 Sexual Health)</li>
    <li>"Respiratory" (+1 Respiratory)</li>
    <li>"Bones" (+1 Bone Strength)</li>
    <li>"Joint" (+1 Joint Strength)</li>
</ul>
*Note: this is not an all inclusive list but if you think one should be added then by all means add it and we
will review it at a later point. Also a category should only increase once per product.
<br><br>
Final note, the initial work here is to get all the information from bulk into the app.
Eventually someone will need to go through and adjust the information. For example bulk
says creatine is a weight gainer but that is not completely true.
<br><br>

### Objectives:

- [ ] Extract (Title, Description, Benefits) from every consumable product's web page
- [ ] Increase every category that meets a key phase
- [ ] Store all info into a PostGREs database so we may use it in our app

## Phase 2 - Extract Data from Research
The next phase is to extracted information from various research articles that support one of the above claims.

These articles should be links so that an individual can learn more about them if they so desire.
```buildoutcfg
    Supporting Research (not found on bulksupplement's mobile app)
    [1] "Creatine Monohydrate increases muscle mass by 12%"
    [2] "3lb weight gain from using creatine"
    [3] "Boosts anaerobic strength, supports cognitive functioning"
    [4] "Anaerobic strength increased"
    [5] "Nooptropics with minimal side effects"
```

## Phase 3 - Intake Strategy
This section should contain (which might have to be manual inputs)
```buildoutcfg
    Intake Strategy
        Summary Of Compound
            The general benefit to consuming this compound is... which is backed by various research articles.
        Recommened Amount
            To obtain the effects mentioned we recommend consuming 10mg per day... one should never consume more than...
            ...but it is always wise to consult with your doctor before consuming any amount of this product since they
            have a better idea on what will help you and your goals.
        Side Effects / Symptoms of Taking too much
            The side effects of this product appear to be one or more of the following... if you are experiencing any one
            of these then stop consuming the product and consult your doctor before continuing.
```

## Possibilities
Some possible additions include:
<ul>
    <li>Vendors that sell the compound (extra revenue from affiliate marketing)</li>
    <li>A video describing the compound (extra revenue from YouTube ads)</li>
</ul>
