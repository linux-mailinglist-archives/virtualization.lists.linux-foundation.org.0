Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D01565E5D35
	for <lists.virtualization@lfdr.de>; Thu, 22 Sep 2022 10:17:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A44884019D;
	Thu, 22 Sep 2022 08:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A44884019D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgouNj5M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BM5ohZAWQjMt; Thu, 22 Sep 2022 08:17:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 53C5A404B1;
	Thu, 22 Sep 2022 08:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C5A404B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 812AFC0077;
	Thu, 22 Sep 2022 08:17:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A3BDC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 08:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 355D14199D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 08:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355D14199D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=fgouNj5M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DD_1ZifbFnhU
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 08:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F190441978
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F190441978
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Sep 2022 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663834626; x=1695370626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7uqf9ZiKKVhxjvWokPqa/geCJgRrne8PpFucdVEJ0Ow=;
 b=fgouNj5MCKjxayijDJ9fB/3QkYyLzWQQLO5LYBmDgr2VGGAhxEqdawXc
 ZDvAwHyJyukY5w8AfLvBAyO4UACoyL9w+w3g0UrdfwR5JdDCBTWhy/5Xh
 JnnpbP1+ojyAdCZfy2yZ/7cXI4Y0ft6gIztmNFg0NTkypTyK462O0qhVa
 rphKNVxxo3eqxU3XMDpnU94qh7XErGx+TNj5oMktD9TZ7YZ6DIBvSCUBJ
 rpfADy3tK2tEN55mm8dsTw8U+S4Nn5uInZeIuzWGCZ9YhPUsl5RvyXwK4
 SZ6MYQ0f7fKn4YKft3Yq8u5qvw4X9/Xr0aW/VeV52OS7eiRLqzr2np/iF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="364214988"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="364214988"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 01:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="682120403"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2022 01:17:06 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 01:17:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 01:17:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 01:17:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 01:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPnfR6cij4LpxSxD35DFTpYRAuLZsrE8voYmp9RFXUpjSW4FiPwHt2M7BEARF9PJxW3I04R4gFzxWWkvU1I5MbKhBitQHTxabhwh6rI5Wax+oWu2WtqkufusZRgLKFwCzh9F9/jKz71KNMS2IsjHIyTkwhox6MpdbERKyo1P9o/f7KSSiB2EdTzSb40ow9Zn+KN0BKX9D6QaaDEtERViWlnYVxVD174phXN921fXWjUdlbvvw0XOIB8Ok2VQArjT3QkEf8frjP6S5rhPAE80XZkK2q9wfCJWBFXjHUaH0ned1+JsmYJEBX/DpzUNi2mm8xMGAacA7CPm8GJeuf/4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uqf9ZiKKVhxjvWokPqa/geCJgRrne8PpFucdVEJ0Ow=;
 b=RT4EBr1OyOv9H2GNjEg09n63pGFzoBIedfA+Uyh6BW9TCfe5tXalt1NTjhgXngvWsRRHXPWHvZ2C6A/kc96DXiM/jD0/UUNnO2esJfJx90QA3qE9oI5nl3ElVJRt6Q62UmyFvx5v2vnNqjQFY303Cq765b0Q703+3I86QEkeVhsleVv3mFCwkmvKikbSiDBfbIaAdBS5MlSDQ2BLKsRXlx7zqHjJerQowetP4C1ZQFYBAIBojtxw7oM6kTDdUUMf0CPHknU/CGw5Y681bIltt73hjZj3KKvFoRLMjKak0nYPybALUfLbcV72keGhU/8Kl+jKEJOFxd/cNwu2dx6UPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Thu, 22 Sep
 2022 08:17:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%6]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 08:17:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "robdclark@gmail.com" <robdclark@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "agross@kernel.org" <agross@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "orsonzhai@gmail.com"
 <orsonzhai@gmail.com>, "baolin.wang@linux.alibaba.com"
 <baolin.wang@linux.alibaba.com>, "zhang.lyra@gmail.com"
 <zhang.lyra@gmail.com>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, "sricharan@codeaurora.org"
 <sricharan@codeaurora.org>
Subject: RE: [PATCH v4 3/6] iommu: Add return value rules to attach_dev op and
 APIs
Thread-Topic: [PATCH v4 3/6] iommu: Add return value rules to attach_dev op
 and APIs
Thread-Index: AQHYzZN6ZQK0d0lv/0aG9snUQP1bO63rGkjg
Date: Thu, 22 Sep 2022 08:17:03 +0000
Message-ID: <BN9PR11MB527632E5F21AD412991509458C4E9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1663744983.git.nicolinc@nvidia.com>
 <8c3dbf153b63a3002a46bab6e707c63fd8635bb8.1663744983.git.nicolinc@nvidia.com>
In-Reply-To: <8c3dbf153b63a3002a46bab6e707c63fd8635bb8.1663744983.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS7PR11MB5989:EE_
x-ms-office365-filtering-correlation-id: bb73864f-612f-45f1-9ba9-08da9c72d503
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0yihMkRwN03hdj7kBcFHlFAc2ewnn29VP9LSF00mwfstNbNGgZgjaT0G8dygILzHPQtxi7+xW79xuuzSk8zutAULsBtXVgwwqD37jHFKFwdyFmsmRHG00zW/aQ0TP6AzrQM2iUCXfjIrY41W+A462SFK/miWXjxjH9jhjCayicd0K/d9uCM8pFRh3KPUF4O1krVgDEfzeH4qAGnzfRuST2xIvqrVTiAtt2rZBJrocS/NBWYkJRvY52sQ+yBuxh6iqFn9pXyRONc17As4OOwq0HMIRW500+zQkHswOwyAwsTd110vhpoFFAjHsncjcLXy9gQjqL+ecl5mkJ8Dh++hvscghTjsuTggtCEW2ocAuwqvh/+EEkM3nodcfDG2+LOypHKOUUOpwc9uFc1GaikzHgFHXRevLxt7WyaH8ImqjLIl5sisDwSAzVUvOTPiTnZYr4xQctjCdJ/eYIxuXCccK3Y1aMTLdqXkZ8e+ueEv/Mi1rOmei0OOi/Bkkq8XlHZFk5ToQHxEDGI37Rxyplov7TzyOdqTtM5Hch7YcYzvCJCxURHNKHp+zVy4ac/DAGQ+tj+neKxtYsw9L98gLO9cJjq73bVYLyqcYF7+KJCCin01CVDjcDdyQJwaCy4kbLGbuvPmBm7K3tX/fp4YJbo049K1IJjStglvvwwRNDAc4dppKM8XM3YZhXnWzyk6E+85C+6eP+nNniVtN70PaLVj8+JiTKv+so7kGP43SVDgHbsjtoL6MlU4EU/mNBj/7xWVFMbfiTgR+llGoB06/UGPB/EnkvQw/I2qsbVw0stWm8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(8676002)(66476007)(76116006)(66446008)(66556008)(122000001)(82960400001)(4744005)(921005)(110136005)(54906003)(55016003)(5660300002)(8936002)(7406005)(66946007)(64756008)(7416002)(316002)(52536014)(4326008)(33656002)(86362001)(186003)(83380400001)(38070700005)(478600001)(71200400001)(26005)(41300700001)(2906002)(7696005)(6506007)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HKkscBaVo75It3IqUo+/D6GNuWIO5yxjuKnDOj+drWIg1uzsyqsBwMV1VmYg?=
 =?us-ascii?Q?8V0eUJ7pKusyUICSeHIkZZ9uAQO33YGrhRGU6+q0/eMgSal6smkf/AFsbnYI?=
 =?us-ascii?Q?vQ1UdVy6cITIdYQBuNR1utmzy+Db2iMCVRMHiH4W9RNwb7Mxx8pbtfupBqu9?=
 =?us-ascii?Q?ol+KJWtucndGu/Lq9wRXMf7DM1W/wsvGzhUGxjtmsdFpN+/ok4OgR+QhNw4G?=
 =?us-ascii?Q?GjEh85ej1rUYboz/DdA7DtimqnSntUJfZCcA08MG6wFJN4Cd/oZB8jcccI44?=
 =?us-ascii?Q?ccs8nLsNLcZ4GpdIMzh2sZv1rb4T9iMYJDXkuWO66zxxz2phyO2A+vGjtUiC?=
 =?us-ascii?Q?RTsS5n/fntqV5mo/J/xDmyNQzOhQLC8MldmTIFvQM2qcH4YnNEqwCu5FPb5y?=
 =?us-ascii?Q?kSXHs5EaI+lsm7GM8ZLSX8T9uCW0L5EEtRJVRmMWfAYJg5mE+LbzrnOCnGe/?=
 =?us-ascii?Q?84G+q2XNN4plHBRYaPZu5pzO7nIhJzCZ6afo2GDWs5GBsC5p18oXHrHLPiyB?=
 =?us-ascii?Q?JCQBBZGcrJ2XkYMIR0BB7aHRFvRiMZUL0y2J9BXJqOXQPA1PU8ovZjxQkLa8?=
 =?us-ascii?Q?5CpQMiDehra6nf22qQe5RKSnBTdcTR+FUPPjtuW36v1PW/D3RY3h0SGcdjW0?=
 =?us-ascii?Q?eFF+RyPWrTgcOYIKaQrZub+iBp3lkeJHRF360CIFfNkEA53BxHdCYy2I3UKM?=
 =?us-ascii?Q?odub6iklfjoQhWQdSiQ29fkD5maqQfOlH89UUq3IaUaNjXhrH7nR67o2Nie8?=
 =?us-ascii?Q?KdrlFwunrEasRpW5FrTBsBsaS7B6GIDcDomrdgoz9X7Gr7KS2vQp30ui5MJv?=
 =?us-ascii?Q?L44lXIhJ9dEAGKOuwHB8tYDnJejvafLACJGDMmqoq/ykvnx1v2DiNJopiDyf?=
 =?us-ascii?Q?s/LIkds76j9YosqCylXJBlMf3ZFWXC/hbCfvJtBLqBG825SV93PkokPkagR4?=
 =?us-ascii?Q?hGbmuZDqJfZYWVvY90vbzrnaaUcfjXeqheH7TvgwPnfKjfYnSk/9l1IP1GI3?=
 =?us-ascii?Q?E1uvfWjkxOvImuqA7pvBMQBK02MbrV4wRCj+dqp4NOxJjK/YARJUTqADRSmj?=
 =?us-ascii?Q?8iSq8BpKJxXG/urRJEumX/ZTdKCFX1Ti9b9KXsdvhoT6bVjX1XJesrFSudnA?=
 =?us-ascii?Q?GVCV7mCPRcuogHXRfUjUP8afUhyrYhbOsTUxJi8tyaufAwM8ed5n/0I4ypMh?=
 =?us-ascii?Q?om9ZYwTEZDfvICXF4EtrV5Hk19GGgH/xKed1Q0/AfpdxAW68Mpyd1XmqIHz7?=
 =?us-ascii?Q?lHqdaqXH1egePnIQrfJW0WO1OePEbjG+jLV/A0PH1MSQsY3jql1V0TH9q5xM?=
 =?us-ascii?Q?djT/EJaKU4pCajdsWNvsLAZSkNpmU/U4S8nxC55tdZXbOth+Y8cDt22MQX2W?=
 =?us-ascii?Q?hq/4mO8PXJoc/lYzO27IeJa3D+bKvt++Q/gcMgF/76hmLt0THxaJb2dthDOP?=
 =?us-ascii?Q?/HFSEzMe+8IqqzXsbR0KpKjUVYSeDhFZIMBvR9hoPWsRQ3tX7XN0iUvNab8e?=
 =?us-ascii?Q?p6AOwGU24Pxa+epUgWGitG696RfPNIXKrgMAwh8AP4Ots6Ph9iC5/HdblGnZ?=
 =?us-ascii?Q?p2IoFPWzQ6P1Nup0QpSsgw5mPGB3Zur3yPpgJMAu?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb73864f-612f-45f1-9ba9-08da9c72d503
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 08:17:03.9697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RzlozUEBt6KwTh96SenVWvzhrrlN/ldexvxoHdqtVYwV5ASpMuSm8rcT/NSrEFBmjSfOCEcJ5tI2gmHJp1ouyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-OriginatorOrg: intel.com
Cc: "quic_saipraka@quicinc.com" <quic_saipraka@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jon@solid-run.com" <jon@solid-run.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "yong.wu@mediatek.com" <yong.wu@mediatek.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, September 21, 2022 4:23 PM
> 
> 
> +/**
> + * iommu_attach_device - Attach a device to an IOMMU domain
> + * @domain: IOMMU domain to attach
> + * @dev: Device that will be attached
> + *
> + * Returns 0 on success and error code on failure
> + *
> + * Note that EINVAL may be returned as a soft failure if the domain and
> device
> + * are incompatible due to some previous configuration of the domain, in
> which
> + * case attaching the same device to a different domain may succeed.

Revise a bit:

 * Note that EINVAL can be treated as a soft failure, indicating
 * that certain configuration of the domain is incompatible with
 * the device. In this case attaching a different domain to the
 * device may succeed.

Apart from that:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
