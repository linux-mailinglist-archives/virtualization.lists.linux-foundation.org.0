Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56A2860BD
	for <lists.virtualization@lfdr.de>; Wed,  7 Oct 2020 15:58:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 495BC81F17;
	Wed,  7 Oct 2020 13:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCp-6OB2j64O; Wed,  7 Oct 2020 13:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B4EE86AAB;
	Wed,  7 Oct 2020 13:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 174C9C0051;
	Wed,  7 Oct 2020 13:58:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5395C0051
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A36C3871E1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 13:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOH4f3lq0CRS
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 13:58:13 +0000 (UTC)
X-Greylist: delayed 00:18:42 by SQLgrey-1.7.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 040AB8719A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 13:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2WoN8X5+RD1vbM77hPkD0vMdasG6qeayZFEZPlUfPxOHHD7lFSM7Mg0OvDQjTtLQ1oTe8eoxCg8QlJmjhnn5iA4fSE9VQ7l3PEoT1Q8gJ73u6G1d5MdyHX1NdHuAtepebLx6kcYz/kUz8DCcTRZlXuFaVz7acr+Jt8woRwdKSCwj7eoMnKChCoCwn+qbMBrqzo/pzw0Dl4wPhi2vD39eS7gJ3I25JEQVxK0JR08pj5gynFxWwdFveUPSOrPbe7pWCzB3/RFBPBDyUF/go4OA8ZTDr2/6tWKXmmBwtLj9TcyZ+Km4lhkIYhAGGONOFwOKVkJt3B7OL1pSJHllRunpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWI3zJwa2ezYvNP8JGJlZCNI2a3YOk5cUf0/UOiaX54=;
 b=Oew9gstSZQFMRh91zzeBC171yKaDBdvb9vnkbD10W7WYF5XIsiRXrOrp6Qdc5i0Kndks/iZYi9b6vHIWq8hBXroM2bhD96+wAtxs913fzXGHWHqd//noenXt5LJMzi4/pl3l8wGUL8Q3bepUedMbfM0U7WFmvmo5qiJ1UYU8Cy2EfHDvvGpImNB/DMUHA8WCRUZW4dmMZ3Yj4ttID61QXpSoRgFSRv7vYrGF4dxyS7RHSsESLcS3kifTwsINWp0BjydVPaPONxfDYMlf6Z5xL3vVgDvGlyJYqFk0D4CrWgbaur+vOO43snJVoIP9fJ2VXDbuJOfKrwep7TqbaJMq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWI3zJwa2ezYvNP8JGJlZCNI2a3YOk5cUf0/UOiaX54=;
 b=qJshi9DWsqyFEwVtrtd1DFVBURAq2676pJBh8hwucv3AKKa+L+zIbHZKT1Ek+F57ZjrPnKFb2APy4QgqoHy26NGUjajfZSrRpzoA3pdRUBmneXtbVUm0hNtjMda2o6qgB7sbvi+uqxpRFkmoGbZe3R3fzF+2HVr2YDbCPtYuFXc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:24:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 13:24:53 +0000
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local>
 <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
 <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
 <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
Date: Wed, 7 Oct 2020 15:24:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0108.eurprd07.prod.outlook.com
 (2603:10a6:207:7::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:207:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.11 via Frontend Transport; Wed, 7 Oct 2020 13:24:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7c1e972-30c6-46d3-ad81-08d86ac45ff5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41108A13416BDF765190124E830A0@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNXbOPcM1rz71/hjPT5YJfdFGjniOIqMDn1zzWpNlVpCEgin/iQ4YoDO9Sw1uAeB8UPOJZePYABJrLH/NRYZnOHZn0NwmdjgEmzooStQgdk9XwUg2sp0rPP3Sa1mUNpSx+CS6YVqsaIdFDbFDseDd27toKEI1nVBimPygXzg87BOnuSaP9bzHgLb3WZmknsX3YLQjgJr/fhfFvZQSIXdCsaXjhdO+6yaNflRcFXNM88a9w514NTu8upiq0BW7ZPB942IciRWsH0g45AG5M0eFqf0hRJ8Z58mSwMVrXrX005d96Q5+Tcx3ahW1iNJhkAFHDYI8+cz71Lb8PbK5LIJwxO7d8VWQhFQkGtNpl6bCW0EdIuF2lA6xeMTBPhGFiAdEQ4TR8M3LJcxXkUN5oKJ5kq/FySYKTxAz8u7PtzcvnuFcl92PhhjwoiFaB8vx/ZE8bOeld9uo3lQ27OdbOyTlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39850400004)(376002)(396003)(31696002)(66556008)(6486002)(66574015)(66476007)(66946007)(83380400001)(110136005)(54906003)(36756003)(31686004)(316002)(53546011)(966005)(7406005)(7416002)(4326008)(83080400001)(86362001)(52116002)(8936002)(2906002)(8676002)(478600001)(30864003)(45080400002)(5660300002)(6666004)(2616005)(16526019)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FY0lIHvIykfmcEYSA048hzn7cbrKJVZ+798v2+X2FHrAch//tOBywkS6Nh88SrXrzxAfAd7SLnozk1rNNMn5F0vxxDJLUiMzZ16si3TrOFpYHvEBFvALgkLmNoL8U/jRttHaOCnzt2qa8QUVeFLcjewMaktRs0eXHQlyrHawrl5nl5pDRjHvQhKLJm2zAl5Ue0RnhCSH7aSqLy7myAKkNtmsrMh4ad7qqYb7Cz1/hSugABrvKobzMgG6m2TRUZLyabBn/e7rxwvX10TnY10NYPd90VF2DZ/D0m5lQOYq7ikD1xIt0L2Pf17g3JGep8SSRdROu79VwZLNTV11DdLOeu/a6ffP5pRQbbbfMgOkFZWre3f8xhnD2MEBVp8vngGGDOl8eVM5f2KtYtFeiZog+1vnOFV6E4YOy9PbmK9u28kfnZ1DAvb7EhBCEmdKvbH7ZZIFFQxBbZeJ74bYxu8AP+EvqcwocxhB0R6N+SLQ4keH68YOV1QrbLp9OuVExYOnCvQdqz788advBKYLBI/bcorXPIgm3x4lA3tS0i4R3A0fhAcPRPT559bI+SfFjyHK3zEOv64AM8zAlEG49b+zaMetDzvHqPmzXRZS4JRhcLSQG5hKapKGA4HV60G6zYWfYzvykowlOtWtS6VnVbXesYj20l4TodyqKqfITCCNsnwPFPOjq6iwylxeBFRWxUR7LhYGMYMHjyg5Fsd8eFy57g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c1e972-30c6-46d3-ad81-08d86ac45ff5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:24:53.3383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGdflGHJrwI1vLmoyVOY2z80IsatzH8y4pl1qpRi/s4Xsa6YOaoPZHfEM78mqTN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
Cc: Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Kukjin Kim <kgene@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

QW0gMDcuMTAuMjAgdW0gMTU6MjAgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMDcuMTAuMjAgdW0gMTU6MTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBPbiBXZWQsIE9j
dCA3LCAyMDIwIGF0IDI6NTcgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOgo+Pj4gSGkKPj4+Cj4+PiBBbSAwMi4xMC4yMCB1bSAxMTo1OCBzY2hyaWViIERh
bmllbCBWZXR0ZXI6Cj4+Pj4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDI6NTE6NDZQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMjoz
NCBQTSBDaHJpc3RpYW4gS8O2bmlnCj4+Pj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdy
b3RlOgo+Pj4+Pj4gQW0gMzAuMDkuMjAgdW0gMTE6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+
Pj4+Pj4+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDEwOjM0OjMxQU0gKzAyMDAsIENocmlzdGlh
biBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+IEFtIDMwLjA5LjIwIHVtIDEwOjE5IHNjaHJpZWIgVGhv
bWFzIFppbW1lcm1hbm46Cj4+Pj4+Pj4+PiBIaQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEFtIDMwLjA5
LjIwIHVtIDEwOjA1IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+Pj4+Pj4+PiBBbSAyOS4w
OS4yMCB1bSAxOTo0OSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+Pj4+Pj4+Pj4+PiBIaSBD
aHJpc3RpYW4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQW0gMjkuMDkuMjAgdW0gMTc6MzUgc2No
cmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4+Pj4+Pj4+Pj4gQW0gMjkuMDkuMjAgdW0gMTc6MTQg
c2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPj4+Pj4+Pj4+Pj4+PiBUaGUgbmV3IGhlbHBlciB0
dG1fa21hcF9vYmpfdG9fZG1hX2J1ZigpIGV4dHJhY3RzIGFkZHJlc3MgYW5kIGxvY2F0aW9uCj4+
Pj4+Pj4+Pj4+Pj4gZnJvbSBhbmQgaW5zdGFuY2Ugb2YgVFRNJ3Mga21hcF9vYmogYW5kIGluaXRp
YWxpemVzIHN0cnVjdCBkbWFfYnVmX21hcAo+Pj4+Pj4+Pj4+Pj4+IHdpdGggdGhlc2UgdmFsdWVz
LiBIZWxwZnVsIGZvciBUVE0tYmFzZWQgZHJpdmVycy4KPj4+Pj4+Pj4+Pj4+IFdlIGNvdWxkIGNv
bXBsZXRlbHkgZHJvcCB0aGF0IGlmIHdlIHVzZSB0aGUgc2FtZSBzdHJ1Y3R1cmUgaW5zaWRlIFRU
TSBhcwo+Pj4+Pj4+Pj4+Pj4gd2VsbC4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBBZGRpdGlv
bmFsIHRvIHRoYXQgd2hpY2ggZHJpdmVyIGlzIGdvaW5nIHRvIHVzZSB0aGlzPwo+Pj4+Pj4+Pj4+
PiBBcyBEYW5pZWwgbWVudGlvbmVkLCBpdCdzIGluIHBhdGNoIDMuIFRoZSBUVE0tYmFzZWQgZHJp
dmVycyB3aWxsCj4+Pj4+Pj4+Pj4+IHJldHJpZXZlIHRoZSBwb2ludGVyIHZpYSB0aGlzIGZ1bmN0
aW9uLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBJIGRvIHdhbnQgdG8gc2VlIGFsbCB0aGF0IGJl
aW5nIG1vcmUgdGlnaHRseSBpbnRlZ3JhdGVkIGludG8gVFRNLCBidXQKPj4+Pj4+Pj4+Pj4gbm90
IGluIHRoaXMgc2VyaWVzLiBUaGlzIG9uZSBpcyBhYm91dCBmaXhpbmcgdGhlIGJvY2hzLW9uLXNw
YXJjNjQKPj4+Pj4+Pj4+Pj4gcHJvYmxlbSBmb3IgZ29vZC4gUGF0Y2ggNyBhZGRzIGFuIHVwZGF0
ZSB0byBUVE0gdG8gdGhlIERSTSBUT0RPIGxpc3QuCj4+Pj4+Pj4+Pj4gSSBzaG91bGQgaGF2ZSBh
c2tlZCB3aGljaCBkcml2ZXIgeW91IHRyeSB0byBmaXggaGVyZSA6KQo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gSW4gdGhpcyBjYXNlIGp1c3Qga2VlcCB0aGUgZnVuY3Rpb24gaW5zaWRlIGJvY2hzIGFu
ZCBvbmx5IGZpeCBpdCB0aGVyZS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFsbCBvdGhlciBkcml2
ZXJzIGNhbiBiZSBmaXhlZCB3aGVuIHdlIGdlbmVyYWxseSBwdW1wIHRoaXMgdGhyb3VnaCBUVE0u
Cj4+Pj4+Pj4+PiBEaWQgeW91IHRha2UgYSBsb29rIGF0IHBhdGNoIDM/IFRoaXMgZnVuY3Rpb24g
d2lsbCBiZSB1c2VkIGJ5IFZSQU0KPj4+Pj4+Pj4+IGhlbHBlcnMsIG5vdXZlYXUsIHJhZGVvbiwg
YW1kZ3B1IGFuZCBxeGwuIElmIHdlIGRvbid0IHB1dCBpdCBoZXJlLCB3ZQo+Pj4+Pj4+Pj4gaGF2
ZSB0byBkdXBsaWNhdGUgdGhlIGZ1bmN0aW9uYWxpdHkgaW4gZWFjaCBpZiB0aGVzZSBkcml2ZXJz
LiBCb2Nocwo+Pj4+Pj4+Pj4gaXRzZWxmIHVzZXMgVlJBTSBoZWxwZXJzIGFuZCBkb2Vzbid0IHRv
dWNoIHRoZSBmdW5jdGlvbiBkaXJlY3RseS4KPj4+Pj4+Pj4gQWgsIG9rIGNhbiB3ZSBoYXZlIHRo
YXQgdGhlbiBvbmx5IGluIHRoZSBWUkFNIGhlbHBlcnM/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFsdGVy
bmF0aXZlIHlvdSBjb3VsZCBnbyBhaGVhZCBhbmQgdXNlIGRtYV9idWZfbWFwIGluIHR0bV9ib19r
bWFwX29iago+Pj4+Pj4+PiBkaXJlY3RseSBhbmQgZHJvcCB0aGUgaGFjayB3aXRoIHRoZSBUVE1f
Qk9fTUFQX0lPTUVNX01BU0suCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdoYXQgSSB3YW50IHRvIGF2b2lk
IGlzIHRvIGhhdmUgYW5vdGhlciBjb252ZXJzaW9uIGZ1bmN0aW9uIGluIFRUTSBiZWNhdXNlCj4+
Pj4+Pj4+IHdoYXQgaGFwcGVucyBoZXJlIGlzIHRoYXQgd2UgYWxyZWFkeSBjb252ZXJ0IGZyb20g
dHRtX2J1c19wbGFjZW1lbnQgdG8KPj4+Pj4+Pj4gdHRtX2JvX2ttYXBfb2JqIGFuZCB0aGVuIHRv
IGRtYV9idWZfbWFwLgo+Pj4+Pj4+IEhtIEknbSBub3QgcmVhbGx5IHNlZWluZyBob3cgdGhhdCBo
ZWxwcyB3aXRoIGEgZ3JhZHVhbCBjb252ZXJzaW9uIG9mCj4+Pj4+Pj4gZXZlcnl0aGluZyBvdmVy
IHRvIGRtYV9idWZfbWFwIGFuZCBhc3NvcnRlZCBoZWxwZXJzIGZvciBhY2Nlc3M/IFRoZXJlJ3MK
Pj4+Pj4+PiB0b28gbWFueSBwbGFjZXMgaW4gdHRtIGRyaXZlcnMgd2hlcmUgaXNfaW9tZW0gYW5k
IHJlbGF0ZWQgc3R1ZmYgaXMgdXNlZCB0bwo+Pj4+Pj4+IGJlIGFibGUgdG8gY29udmVydCBpdCBh
bGwgaW4gb25lIGdvLiBBbiBpbnRlcm1lZGlhdGUgc3RhdGUgd2l0aCBhIGJ1bmNoIG9mCj4+Pj4+
Pj4gY29udmVyc2lvbnMgc2VlbXMgZmFpcmx5IHVuYXZvaWRhYmxlIHRvIG1lLgo+Pj4+Pj4gRmFp
ciBlbm91Z2guIEkgd291bGQganVzdCBoYXZlIHN0YXJ0ZWQgYm90dG9tIHVwIGFuZCBub3QgdG9w
IGRvd24uCj4+Pj4+Pgo+Pj4+Pj4gQW55d2F5IGZlZWwgZnJlZSB0byBnbyBhaGVhZCB3aXRoIHRo
aXMgYXBwcm9hY2ggYXMgbG9uZyBhcyB3ZSBjYW4gcmVtb3ZlCj4+Pj4+PiB0aGUgbmV3IGZ1bmN0
aW9uIGFnYWluIHdoZW4gd2UgY2xlYW4gdGhhdCBzdHVmZiB1cCBmb3IgZ29vZC4KPj4+Pj4gWWVh
aCBJIGd1ZXNzIGJvdHRvbSB1cCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgYXMgYSByZWZhY3Rvcmlu
Zy4gQnV0IHRoZQo+Pj4+PiBtYWluIG1vdGl2YXRpb24gdG8gbGFuZCB0aGlzIGhlcmUgaXMgdG8g
Zml4IHRoZSBfX21taW8gdnMgbm9ybWFsCj4+Pj4+IG1lbW9yeSBjb25mdXNpb24gaW4gdGhlIGZi
ZGV2IGVtdWxhdGlvbiBoZWxwZXJzIGZvciBzcGFyYyAoYW5kCj4+Pj4+IGFueXRoaW5nIGVsc2Ug
dGhhdCBuZWVkcyB0aGlzKS4gSGVuY2UgdGhlIHRvcCBkb3duIGFwcHJvYWNoIGZvcgo+Pj4+PiBy
b2xsaW5nIHRoaXMgb3V0Lgo+Pj4+IE9rIEkgc3RhcnRlZCByZXZpZXdpbmcgdGhpcyBhIGJpdCBt
b3JlIGluLWRlcHRoLCBhbmQgSSB0aGluayB0aGlzIGlzIGEgYml0Cj4+Pj4gdG9vIG11Y2ggb2Yg
YSBkZS10b3VyLgo+Pj4+Cj4+Pj4gTG9va2luZyB0aHJvdWdoIGFsbCB0aGUgY2FsbGVycyBvZiB0
dG1fYm9fa21hcCBhbG1vc3QgZXZlcnlvbmUgbWFwcyB0aGUKPj4+PiBlbnRpcmUgb2JqZWN0LiBP
bmx5IHZtd2dmeCB1c2VzIHRvIG1hcCBsZXNzIHRoYW4gdGhhdC4gQWxzbywgZXZlcnlvbmUganVz
dAo+Pj4+IGltbWVkaWF0ZWx5IGZvbGxvd3MgdXAgd2l0aCBjb252ZXJ0aW5nIHRoYXQgZnVsbCBv
YmplY3QgbWFwIGludG8gYQo+Pj4+IHBvaW50ZXIuCj4+Pj4KPj4+PiBTbyBJIHRoaW5rIHdoYXQg
d2UgcmVhbGx5IHdhbnQgaGVyZSBpczoKPj4+PiAtIG5ldyBmdW5jdGlvbgo+Pj4+Cj4+Pj4gaW50
IHR0bV9ib192bWFwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCBkbWFfYnVm
X21hcCAqbWFwKTsKPj4+Pgo+Pj4+ICAgIF92bWFwIG5hbWUgc2luY2UgdGhhdCdzIGNvbnNpc3Rl
bnQgd2l0aCBib3RoIGRtYV9idWYgZnVuY3Rpb25zIGFuZAo+Pj4+ICAgIHdoYXQncyB1c3VhbGx5
IHVzZWQgdG8gaW1wbGVtZW50IHRoaXMuIE91dHNpZGUgb2YgdGhlIHR0bSB3b3JsZCBrbWFwCj4+
Pj4gICAgdXN1YWxseSBqdXN0IG1lYW5zIHNpbmdsZS1wYWdlIG1hcHBpbmdzIHVzaW5nIGttYXAo
KSBvciBpdCdzIGlvbWVtCj4+Pj4gICAgc2libGluZyBpb19tYXBwaW5nX21hcCogc28gcmF0aGVy
IGNvbmZ1c2luZyBuYW1lIGZvciBhIGZ1bmN0aW9uIHdoaWNoCj4+Pj4gICAgdXN1YWxseSBpcyBq
dXN0IHVzZWQgdG8gc2V0IHVwIGEgdm1hcCBvZiB0aGUgZW50aXJlIGJ1ZmZlci4KPj4+Pgo+Pj4+
IC0gYSBoZWxwZXIgd2hpY2ggY2FuIGJlIHVzZWQgZm9yIHRoZSBkcm1fZ2VtX29iamVjdF9mdW5j
cyB2bWFwL3Z1bm1hcAo+Pj4+ICAgIGZ1bmN0aW9ucyBmb3IgYWxsIHR0bSBkcml2ZXJzLiBXZSBz
aG91bGQgYmUgYWJsZSB0byBtYWtlIHRoaXMgZnVsbHkKPj4+PiAgICBnZW5lcmljIGJlY2F1c2Ug
YSkgd2Ugbm93IGhhdmUgZG1hX2J1Zl9tYXAgYW5kIGIpIGRybV9nZW1fb2JqZWN0IGlzCj4+Pj4g
ICAgZW1iZWRkZWQgaW4gdGhlIHR0bV9ibywgc28gd2UgY2FuIHVwY2FzdCBmb3IgZXZlcnlvbmUg
d2hvJ3MgYm90aCBhIHR0bQo+Pj4+ICAgIGFuZCBnZW0gZHJpdmVyLgo+Pj4+Cj4+Pj4gICAgVGhp
cyBpcyBtYXliZSBhIGdvb2QgZm9sbG93LXVwLCBzaW5jZSBpdCBzaG91bGQgYWxsb3cgdXMgdG8g
ZGl0Y2ggcXVpdGUKPj4+PiAgICBhIGJpdCBvZiB0aGUgdnJhbSBoZWxwZXIgY29kZSBmb3IgdGhp
cyBtb3JlIGdlbmVyaWMgc3R1ZmYuIEkgYWxzbyBtaWdodAo+Pj4+ICAgIGhhdmUgbWlzc2VkIHNv
bWUgc3BlY2lhbC1jYXNlcyBoZXJlLCBidXQgZnJvbSBhIHF1aWNrIGxvb2sgZXZlcnl0aGluZwo+
Pj4+ICAgIGp1c3QgcGlucyB0aGUgYnVmZmVyIHRvIHRoZSBjdXJyZW50IGxvY2F0aW9uIGFuZCB0
aGF0J3MgaXQuCj4+Pj4KPj4+PiAgICBBbHNvIHRoaXMgb2J2aW91c2x5IHJlcXVpcmVzIENocmlz
dGlhbidzIGdlbmVyaWMgdHRtX2JvX3BpbiByZXdvcmsKPj4+PiAgICBmaXJzdC4KPj4+Pgo+Pj4+
IC0gcm9sbCB0aGUgYWJvdmUgb3V0IHRvIGRyaXZlcnMuCj4+Pj4KPj4+PiBDaHJpc3RpYW4vVGhv
bWFzLCB0aG91Z2h0cyBvbiB0aGlzPwo+Pj4gSSBhZ3JlZSBvbiB0aGUgZ29hbHMsIGJ1dCB3aGF0
IGlzIHRoZSBpbW1lZGlhdGUgb2JqZWN0aXZlIGhlcmU/Cj4+Pgo+Pj4gQWRkaW5nIHR0bV9ib192
bWFwKCkgZG9lcyBub3Qgd29yayBvdXQgZWFzaWx5LCBhcyBzdHJ1Y3QgdHRtX2JvX2ttYXBfb2Jq
Cj4+PiBpcyBhIGNlbnRyYWwgcGFydCBvZiB0aGUgaW50ZXJuYWxzIG9mIFRUTS4gc3RydWN0IHR0
bV9ib19rbWFwX29iaiBoYXMKPj4+IG1vcmUgaW50ZXJuYWwgc3RhdGUgdGhhdCBzdHJ1Y3QgZG1h
X2J1Zl9tYXAsIHNvIHRoZXkgYXJlIG5vdCBlYXNpbHkKPj4+IGNvbnZlcnRpYmxlIGVpdGhlci4g
V2hhdCB5b3UgcHJvcG9zZSBzZWVtcyB0byByZXF1aXJlIGEgcmVpbXBsZW1lbnRhdGlvbgo+Pj4g
b2YgdGhlIGV4aXN0aW5nIHR0bV9ib19rbWFwKCkgY29kZS4gVGhhdCBpcyBpdCdzIG93biBwYXRj
aCBzZXJpZXMuCj4+Pgo+Pj4gSSdkIHJhdGhlciBnbyB3aXRoIHNvbWUgdmFyaWFudCBvZiB0aGUg
ZXhpc3RpbmcgcGF0Y2ggYW5kIGFkZAo+Pj4gdHRtX2JvX3ZtYXAoKSBpbiBhIGZvbGxvdy11cC4K
Pj4gdHRtX2JvX3ZtYXAgd291bGQgc2ltcGx5IHdyYXAgd2hhdCB5b3UgY3VycmVudGx5IG9wZW4t
Y29kZSBhcwo+PiB0dG1fYm9fa21hcCArIHR0bV9rbWFwX29ial90b19kbWFfYnVmX21hcC4gUmVt
b3ZpbmcgdHRtX2ttYXBfb2JqIHdvdWxkCj4+IGJlIGEgbXVjaCBsYXRlciBzdGVwLiBXaHkgZG8g
eW91IHRoaW5rIGFkZGluZyB0dG1fYm9fdm1hcCBpcyBub3QKPj4gcG9zc2libGU/Cj4gVGhlIGNh
bGxzIHRvIHR0bV9ib19rbWFwL19rdW5tYXAoKSByZXF1aXJlIGFuIGluc3RhbmNlIG9mIHN0cnVj
dAo+IHR0bV9ib19rbWFwX29iaiB0aGF0IGlzIHN0b3JlZCBpbiBlYWNoIGRyaXZlcidzIHByaXZh
dGUgYm8gc3RydWN0dXJlCj4gKGUuZy4sIHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0LCBzdHJ1
Y3QgcmFkZW9uX2JvLCBldGMpLiBXaGVuIEkgbWFkZQo+IHBhdGNoIDMsIEkgZmxpcnRlZCB3aXRo
IHRoZSBpZGVhIG9mIHVuaWZ5aW5nIHRoZSBkcml2ZXIncyBfdm1hcCBjb2RlIGluCj4gYSBzaGFy
ZWQgaGVscGVyLCBidXQgSSBjb3VsZG4ndCBmaW5kIGEgc2ltcGxlIHdheSBvZiBkb2luZyBpdC4g
VGhhdCdzCj4gd2h5IGl0J3Mgb3Blbi1jb2RlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpXZWxsIHRo
YXQgbWFrZXMga2luZCBvZiBzZW5zZS4gS2VlcCBpbiBtaW5kIHRoYXQgdHRtX2JvX2ttYXAgaXMg
CmN1cnJlbnRseSB3YXkgdG8gY29tcGxpY2F0ZWQuCgpDaHJpc3RpYW4uCgo+Cj4gQmVzdCByZWdh
cmRzCj4gVGhvbWFzCj4KPj4gLURhbmllbAo+Pgo+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+PiBUaG9t
YXMKPj4+Cj4+Pj4gSSB0aGluayBmb3IgdGhlIGltbWVkaWF0ZSBuZWVkIG9mIHJvbGxpbmcgdGhp
cyBvdXQgZm9yIHZyYW0gaGVscGVycyBhbmQKPj4+PiBmYmRldiBjb2RlIHdlIHNob3VsZCBiZSBh
YmxlIHRvIGRvIHRoaXMsIGJ1dCBqdXN0IHBvc3Rwb25lIHRoZSBkcml2ZXIgd2lkZQo+Pj4+IHJv
bGwtb3V0IGZvciBub3cuCj4+Pj4KPj4+PiBDaGVlcnMsIERhbmllbAo+Pj4+Cj4+Pj4+IC1EYW5p
ZWwKPj4+Pj4KPj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Cj4+Pj4+Pj4gLURhbmllbAo+Pj4+Pj4+
Cj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
QmVzdCByZWdhcmRzCj4+Pj4+Pj4+PiBUaG9tYXMKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gUmVnYXJk
cywKPj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQmVzdCByZWdh
cmRzCj4+Pj4+Pj4+Pj4+IFRob21hcwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gUmVnYXJkcywK
Pj4+Pj4+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+Pj4+Pj4+
Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+Pj4gICAgICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5o
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+Pj4+Pj4gICAgICBpbmNsdWRl
L2xpbnV4L2RtYS1idWYtbWFwLmggIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPj4+Pj4+Pj4+
Pj4+PiAgICAgIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgg
Yi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4+Pj4+Pj4+Pj4+Pj4gaW5kZXggYzk2YTI1
ZDU3MWM4Li42MmQ4OWYwNWE4MDEgMTAwNjQ0Cj4+Pj4+Pj4+Pj4+Pj4gLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4+Pj4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90
dG1fYm9fYXBpLmgKPj4+Pj4+Pj4+Pj4+PiBAQCAtMzQsNiArMzQsNyBAQAo+Pj4+Pj4+Pj4+Pj4+
ICAgICAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+Cj4+Pj4+Pj4+Pj4+Pj4gICAgICAjaW5jbHVk
ZSA8ZHJtL2RybV9oYXNodGFiLmg+Cj4+Pj4+Pj4+Pj4+Pj4gICAgICAjaW5jbHVkZSA8ZHJtL2Ry
bV92bWFfbWFuYWdlci5oPgo+Pj4+Pj4+Pj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi1t
YXAuaD4KPj4+Pj4+Pj4+Pj4+PiAgICAgICNpbmNsdWRlIDxsaW51eC9rcmVmLmg+Cj4+Pj4+Pj4+
Pj4+Pj4gICAgICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+Pj4+Pj4+Pj4+Pj4+ICAgICAgI2lu
Y2x1ZGUgPGxpbnV4L3dhaXQuaD4KPj4+Pj4+Pj4+Pj4+PiBAQCAtNDg2LDYgKzQ4NywyOSBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgKnR0bV9rbWFwX29ial92aXJ0dWFsKHN0cnVjdAo+Pj4+Pj4+Pj4+
Pj4+IHR0bV9ib19rbWFwX29iaiAqbWFwLAo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgIHJldHVybiBt
YXAtPnZpcnR1YWw7Cj4+Pj4+Pj4+Pj4+Pj4gICAgICB9Cj4+Pj4+Pj4+Pj4+Pj4gICAgICArLyoq
Cj4+Pj4+Pj4+Pj4+Pj4gKyAqIHR0bV9rbWFwX29ial90b19kbWFfYnVmX21hcAo+Pj4+Pj4+Pj4+
Pj4+ICsgKgo+Pj4+Pj4+Pj4+Pj4+ICsgKiBAa21hcDogQSBzdHJ1Y3QgdHRtX2JvX2ttYXBfb2Jq
IHJldHVybmVkIGZyb20gdHRtX2JvX2ttYXAuCj4+Pj4+Pj4+Pj4+Pj4gKyAqIEBtYXA6IFJldHVy
bnMgdGhlIG1hcHBpbmcgYXMgc3RydWN0IGRtYV9idWZfbWFwCj4+Pj4+Pj4+Pj4+Pj4gKyAqCj4+
Pj4+Pj4+Pj4+Pj4gKyAqIENvbnZlcnRzIHN0cnVjdCB0dG1fYm9fa21hcF9vYmogdG8gc3RydWN0
IGRtYV9idWZfbWFwLiBJZiB0aGUgbWVtb3J5Cj4+Pj4+Pj4+Pj4+Pj4gKyAqIGlzIG5vdCBtYXBw
ZWQsIHRoZSByZXR1cm5lZCBtYXBwaW5nIGlzIGluaXRpYWxpemVkIHRvIE5VTEwuCj4+Pj4+Pj4+
Pj4+Pj4gKyAqLwo+Pj4+Pj4+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2ttYXBfb2Jq
X3RvX2RtYV9idWZfbWFwKHN0cnVjdCB0dG1fYm9fa21hcF9vYmoKPj4+Pj4+Pj4+Pj4+PiAqa21h
cCwKPj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRtYV9i
dWZfbWFwICptYXApCj4+Pj4+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+Pj4+PiArICAgIGJvb2wgaXNf
aW9tZW07Cj4+Pj4+Pj4+Pj4+Pj4gKyAgICB2b2lkICp2YWRkciA9IHR0bV9rbWFwX29ial92aXJ0
dWFsKGttYXAsICZpc19pb21lbSk7Cj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4+ICsgICAg
aWYgKCF2YWRkcikKPj4+Pj4+Pj4+Pj4+PiArICAgICAgICBkbWFfYnVmX21hcF9jbGVhcihtYXAp
Owo+Pj4+Pj4+Pj4+Pj4+ICsgICAgZWxzZSBpZiAoaXNfaW9tZW0pCj4+Pj4+Pj4+Pj4+Pj4gKyAg
ICAgICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKG1hcCwgKHZvaWQgX19mb3JjZSBfX2lv
bWVtICopdmFkZHIpOwo+Pj4+Pj4+Pj4+Pj4+ICsgICAgZWxzZQo+Pj4+Pj4+Pj4+Pj4+ICsgICAg
ICAgIGRtYV9idWZfbWFwX3NldF92YWRkcihtYXAsIHZhZGRyKTsKPj4+Pj4+Pj4+Pj4+PiArfQo+
Pj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+PiAgICAgIC8qKgo+Pj4+Pj4+Pj4+Pj4+ICAgICAg
ICogdHRtX2JvX2ttYXAKPj4+Pj4+Pj4+Pj4+PiAgICAgICAqCj4+Pj4+Pj4+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1
Zi1tYXAuaAo+Pj4+Pj4+Pj4+Pj4+IGluZGV4IGZkMWFiYTU0NWZkZi4uMmU4YmJlY2I1MDkxIDEw
MDY0NAo+Pj4+Pj4+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+Pj4+
Pj4+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+Pj4+Pj4+Pj4+Pj4+
IEBAIC00NSw2ICs0NSwxMiBAQAo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICoKPj4+Pj4+Pj4+Pj4+PiAg
ICAgICAqICAgIGRtYV9idWZfbWFwX3NldF92YWRkcigmbWFwLiAweGRlYWRiZWFmKTsKPj4+Pj4+
Pj4+Pj4+PiAgICAgICAqCj4+Pj4+Pj4+Pj4+Pj4gKyAqIFRvIHNldCBhbiBhZGRyZXNzIGluIEkv
TyBtZW1vcnksIHVzZSBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oKS4KPj4+Pj4+Pj4+Pj4+
PiArICoKPj4+Pj4+Pj4+Pj4+PiArICogLi4gY29kZS1ibG9jazo6IGMKPj4+Pj4+Pj4+Pj4+PiAr
ICoKPj4+Pj4+Pj4+Pj4+PiArICogICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKCZtYXAu
IDB4ZGVhZGJlYWYpOwo+Pj4+Pj4+Pj4+Pj4+ICsgKgo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICogVGVz
dCBpZiBhIG1hcHBpbmcgaXMgdmFsaWQgd2l0aCBlaXRoZXIgZG1hX2J1Zl9tYXBfaXNfc2V0KCkg
b3IKPj4+Pj4+Pj4+Pj4+PiAgICAgICAqIGRtYV9idWZfbWFwX2lzX251bGwoKS4KPj4+Pj4+Pj4+
Pj4+PiAgICAgICAqCj4+Pj4+Pj4+Pj4+Pj4gQEAgLTExOCw2ICsxMjQsMjAgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGRtYV9idWZfbWFwX3NldF92YWRkcihzdHJ1Y3QKPj4+Pj4+Pj4+Pj4+PiBkbWFf
YnVmX21hcCAqbWFwLCB2b2lkICp2YWRkcikKPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICBtYXAtPmlz
X2lvbWVtID0gZmFsc2U7Cj4+Pj4+Pj4+Pj4+Pj4gICAgICB9Cj4+Pj4+Pj4+Pj4+Pj4gICAgICAr
LyoqCj4+Pj4+Pj4+Pj4+Pj4gKyAqIGRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbSAtIFNldHMg
YSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlIHRvCj4+Pj4+Pj4+Pj4+Pj4gYW4gYWRkcmVzcyBp
biBJL08gbWVtb3J5Cj4+Pj4+Pj4+Pj4+Pj4gKyAqIEBtYXA6ICAgICAgICBUaGUgZG1hLWJ1ZiBt
YXBwaW5nIHN0cnVjdHVyZQo+Pj4+Pj4+Pj4+Pj4+ICsgKiBAdmFkZHJfaW9tZW06ICAgIEFuIEkv
Ty1tZW1vcnkgYWRkcmVzcwo+Pj4+Pj4+Pj4+Pj4+ICsgKgo+Pj4+Pj4+Pj4+Pj4+ICsgKiBTZXRz
IHRoZSBhZGRyZXNzIGFuZCB0aGUgSS9PLW1lbW9yeSBmbGFnLgo+Pj4+Pj4+Pj4+Pj4+ICsgKi8K
Pj4+Pj4+Pj4+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZfbWFwX3NldF92YWRkcl9p
b21lbShzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCwKPj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICp2YWRkcl9pb21lbSkKPj4+Pj4+Pj4+Pj4+PiAr
ewo+Pj4+Pj4+Pj4+Pj4+ICsgICAgbWFwLT52YWRkcl9pb21lbSA9IHZhZGRyX2lvbWVtOwo+Pj4+
Pj4+Pj4+Pj4+ICsgICAgbWFwLT5pc19pb21lbSA9IHRydWU7Cj4+Pj4+Pj4+Pj4+Pj4gK30KPj4+
Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+Pj4gICAgICAvKioKPj4+Pj4+Pj4+Pj4+PiAgICAgICAq
IGRtYV9idWZfbWFwX2lzX2VxdWFsIC0gQ29tcGFyZXMgdHdvIGRtYS1idWYgbWFwcGluZyBzdHJ1
Y3R1cmVzCj4+Pj4+Pj4+Pj4+Pj4gZm9yIGVxdWFsaXR5Cj4+Pj4+Pj4+Pj4+Pj4gICAgICAgKiBA
bGhzOiAgICBUaGUgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQo+Pj4+Pj4+Pj4+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4+Pj4+Pj4+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4+Pj4+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1h
aWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFu
LmtvZW5pZyU0MGFtZC5jb20lN0M0NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2NTI1ZDFiOCU3QzNk
ZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNzA1NjA0Mzg5NjUw
MTMmYW1wO3NkYXRhPUhkSE9BJTJGMVZjSVglMkY3WXRmWVRpQXFZRXZ3N0FnJTJGUyUyQnhTNVZ3
SktPdjV5MCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdAo+Pj4+Pj4+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+Pj4+Pj4+
PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZh
bWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzQ3
MmMzZDY1NWE2MTQxMWRlYjY3MDhkODY1MjVkMWI4JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM3MDU2MDQzODk2NTAxMyZhbXA7c2RhdGE9SCUyQjVIS0Nz
VHJrc1JWMkV5RWlGR1NUeVM3OWpzV0NtSmltU01vSll1c3g4JTNEJmFtcDtyZXNlcnZlZD0wCj4+
Pj4+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+Pj4+Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+Pj4+Pj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdD
Y2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2NTI1
ZDFiOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNzA1
NjA0Mzg5NjUwMTMmYW1wO3NkYXRhPUhkSE9BJTJGMVZjSVglMkY3WXRmWVRpQXFZRXZ3N0FnJTJG
UyUyQnhTNVZ3SktPdjV5MCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4+Pj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+Pj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+Pj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJG
bGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQw
YW1kLmNvbSU3QzQ3MmMzZDY1NWE2MTQxMWRlYjY3MDhkODY1MjVkMWI4JTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM3MDU2MDQzODk2NTAxMyZhbXA7c2Rh
dGE9SCUyQjVIS0NzVHJrc1JWMkV5RWlGR1NUeVM3OWpzV0NtSmltU01vSll1c3g4JTNEJmFtcDty
ZXNlcnZlZD0wCj4+Pj4+Cj4+Pj4+IC0tCj4+Pj4+IERhbmllbCBWZXR0ZXIKPj4+Pj4gU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+Pj4+IGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cj4+PiAtLQo+Pj4gVGhvbWFzIFppbW1lcm1hbm4KPj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXIKPj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+Pj4gTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpCj4+PiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4+Pgo+PgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
