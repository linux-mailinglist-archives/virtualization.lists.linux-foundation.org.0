Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7542924CE
	for <lists.virtualization@lfdr.de>; Mon, 19 Oct 2020 11:45:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15DB487595;
	Mon, 19 Oct 2020 09:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o+5rq0G6FugU; Mon, 19 Oct 2020 09:45:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F50187517;
	Mon, 19 Oct 2020 09:45:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 258E5C0051;
	Mon, 19 Oct 2020 09:45:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38B9AC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 09:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 208B087509
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 09:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03vbpqRdDe8O
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 09:45:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 13222874F1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 09:45:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/FnliMyyc6PzCm4aGI3rSXrefs5zb8xHdj9d4DoBgWJGSx5tqXDWQNbDsrfwSW64QJXT3XpiEmjQaKx2vI6Nrlwn4sBuq4DsmOg04T61+sn1kk0kLOyVz0WvIGI3psXcXI5nMG9G/Dmg0mR9/R6ERPeYsQo9othw9gpZVI1f2e5k0rhFU6N8yTPH9M1vdOwQKkg432WGS1wQHe/dvgYzS1Ub0lWneymsjUi/oOeusurrTiBxRIoLvzf+pbbgAk8C7j9yE6ik3AO2tqfQ3f/hkJZfkAwvT2+LMf3N2enasi0bLT8oMM/Q93CNjzMu7TxcNvF6CrwSH9SI1C9u81htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy5wcv5D2MUJuqKGL0V1ByCyOy9bh9LcggVVNvf/G48=;
 b=XOY4lcQe5HP+yb73hEvle0YLe/CjrfoogLOfcozRJe/tyx2S5zM/lUvq7PE0orshiVfvL+5cQXSTgtFn7LaNy18omq9h3JFx2orDxBnQYk+O5xez1N7aCShbv2a/R2q7RL42rofSB0odkrwjFhHU/m3A1nB7AMfFl9+XvBG8pJBhiYHUsYmASfs1YZB/u/90LS8FOpOJQ1HRAc/k0l66NKSrV/9dEBKbBMh8wgysDXUaZFkSRQzqZxah8MMbnM/zTvIQ8yI17/qmyKHrsDujb3G9pGAKYDBdr5Col73Qt6iqlHzpIm1KqTFIB4tCKTJDt4+qTxzJ6YRc/FqgtlGRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy5wcv5D2MUJuqKGL0V1ByCyOy9bh9LcggVVNvf/G48=;
 b=HAisxrqOxM+yFzBIeivQca5MQl1W0EvQh9xsuS0W2b87Rt1SPj5cCrl7+Oi4yjd2jCISBR4uXY/rDuYAs9kGwzzAz7O+AYk9MEcNArQG26gfIl5eJieuGbvjQCOBJge35t749Mpuih+3wZ7PTUAejRJiSusdxGVeUQynWh6tM2w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 19 Oct
 2020 09:45:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:45:17 +0000
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-6-tzimmermann@suse.de>
 <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
 <87c7c342-88dc-9a36-31f7-dae6edd34626@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9236f51c-c1fa-dadc-c7cc-d9d0c09251d1@amd.com>
Date: Mon, 19 Oct 2020 11:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87c7c342-88dc-9a36-31f7-dae6edd34626@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:208:ac::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.9 via Frontend Transport; Mon, 19 Oct 2020 09:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2de45ee1-d684-4c5f-c143-08d87413af3e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417E35B821E9EF7A5B5AFC6831E0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4JLIMQwIVNzm92UzbJlG+1uGqD85bpaIBIWdkIvqy+5bO5umDecUzbdA2OrHnWTG50cA0ny/JCI1CzZvgyw+1FjN6aHmgVWrigZavYKj4LEcL+cX1UuDfTRfkC8NzdRfzBHjF3yyBdvUo89iJHR7FZMTD0ZlbISd1mPI8Fa5XZpx5SjPmGla1TR5B2rOimNL5gyzLsN/REXOw2vHcHZUuVpHzPapMDpBgw2stBq2jE5cJ9/1g7aIAe24EC6dbmiq0izN119FshZyW9GSTbyY1M+N358gLMv2N13z9bTckIsQ6IA2m5YRbmaev473/bBwUziHD1Gy88gW5JCfltSlE8k1Ia+qPkLFXHGxMrJEs2EZPqnwwDTOjA9VU2UXcpnNRzvMQpqXhcSS3p7NG2ZxaXmUKVj/X/7GDfIarrkPcDn2jqmmV2rzfthVFUk+jt7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(83380400001)(45080400002)(966005)(8676002)(4326008)(31686004)(6666004)(2906002)(186003)(16526019)(36756003)(86362001)(2616005)(478600001)(5660300002)(8936002)(66556008)(66476007)(316002)(66946007)(31696002)(7416002)(7406005)(6486002)(52116002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: DG1IF2aGtntU1HnH8WrGQv0BxrOWgvoFrUvrZ/ETE+qVydH2YByWQoPMDbLtl9PnDVbVhG0frqeMFhQaf3Vtz58lN+BSVBxX/5YUoCuHfVPbHNJ131OF8BG8o6HCx7qfKAWQKi23SjRRvPudmHmWydDaVWdoqlx94dmGGZApy3JBO+X666gv4eq6P1Ayr5gK8mtM4FY0/7ymmY5CLucrj9cD580hMoYunzbjo0HfzPktCM7UcpiT2vhkO+wSXS0SsmI0azvvvWDuBLVpGNm8+l0yiOtuU/dxHEaCNGB3WkK/An6zQrQqh008D0JHt84NNz4bvORAypo23Przrlyso7NFrkuYqC9jaOoFFmI3+T8agjgKPHWUTQ51akC/pRhom8yKrGoOBEnG71Q2UNIplHahwdmMVp/1LRC+khx1EM2TjUWmhOAwm7lgtIJWF0PKBJWS30Vl8X9LENEebXdouzN6nWe3nCnGVUHadIrKdTpq+NbSUTcx+UbOMyZhTs168y9mbcqx+R3rdsxnkJoDT0bF4CJpPCD3DDcTXrxX0amQ/6h4CMtW3V0114sgtEqNNrvMiHRmJH1dN12YFa/MB+4p0JrR+eBXjMZhu9PyaWZpVjCop9rk71seQY2VElj+z0N0U4v+eAESUsMqU9kJs9fohrQ1+WkOCQxetK3hLiK1hTG+R/85SbfwKIcuX7ABSxg5EviUsj6gJOIbQiqtkg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de45ee1-d684-4c5f-c143-08d87413af3e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:45:17.7275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufX6vJ7VDtZTX3Z4vj04OPUaH+aqZVdTPZh+3zWPb5h0W+0bW29R9aWCT+GnVwx0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

SGkgVGhvbWFzLAoKW1NOSVBdCj4+PiAgwqAgK2ludCB0dG1fYm9fdm1hcChzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCkKPj4+ICt7Cj4+PiArwqDC
oMKgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSA9ICZiby0+bWVtOwo+Pj4gK8KgwqDCoCBpbnQg
cmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoCByZXQgPSB0dG1fbWVtX2lvX3Jlc2VydmUoYm8tPmJkZXYs
IG1lbSk7Cj4+PiArwqDCoMKgIGlmIChyZXQpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4+ICsKPj4+ICvCoMKgwqAgaWYgKG1lbS0+YnVzLmlzX2lvbWVtKSB7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgdm9pZCBfX2lvbWVtICp2YWRkcl9pb21lbTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBsb25nIHNpemUgPSBiby0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7Cj4+IFBsZWFz
ZSB1c2UgdWludDY0X3QgaGVyZSBhbmQgbWFrZSBzdXJlIHRvIGNhc3QgYm8tPm51bV9wYWdlcyBi
ZWZvcmUKPj4gc2hpZnRpbmcuCj4gSSB0aG91Z2h0IHRoZSBydWxlIG9mIHRodW1iIGlzIHRvIHVz
ZSB1NjQgaW4gc291cmNlIGNvZGUuIFlldCBUVE0gb25seQo+IHVzZXMgdWludCpfdCB0eXBlcy4g
SXMgdGhlcmUgYW55dGhpbmcgc3BlY2lhbCBhYm91dCBUVE0/CgpNeSBsYXN0IHN0YXR1cyBpcyB0
aGF0IHlvdSBjYW4gdXNlIGJvdGggYW5kIG15IHBlcnNvbmFsIHByZWZlcmVuY2UgaXMgdG8gCnVz
ZSB0aGUgdWludCpfdCB0eXBlcyBiZWNhdXNlIHRoZXkgYXJlIHBhcnQgb2YgYSBoaWdoZXIgbGV2
ZWwgc3RhbmRhcmQuCgo+PiBXZSBoYXZlIGFuIHVuaXQgdGVzdHMgb2YgYWxsb2NhdGluZyBhIDhH
QiBCTyBhbmQgdGhhdCBzaG91bGQgd29yayBvbiBhCj4+IDMyYml0IG1hY2hpbmUgYXMgd2VsbCA6
KQo+Pgo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChtZW0tPmJ1cy5hZGRyKQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFkZHJfaW9tZW0gPSAodm9pZCAqKSgoKHU4ICopbWVtLT5i
dXMuYWRkcikpOwo+IEkgYWZ0ZXIgcmVhZGluZyB0aGUgcGF0Y2ggYWdhaW4sIEkgcmVhbGl6ZWQg
dGhhdCB0aGlzIGlzIHRoZQo+ICd0dG1fYm9fbWFwX3ByZW1hcHBlZCcgY2FzZSBhbmQgaXQncyBt
aXNzaW5nIGZyb20gX3Z1bm1hcCgpLiBJIHNlZSB0d28KPiBvcHRpb25zIGhlcmU6IGlnbm9yZSB0
aGlzIGNhc2UgaW4gX3Z1bm1hcCgpLCBvciBkbyBhbiBpb3JlbWFwKCkKPiB1bmNvbmRpdGlvbmFs
bHkuIFdoaWNoIG9uZSBpcyBwcmVmZXJhYmxlPwoKaW9yZW1hcCB3b3VsZCBiZSB2ZXJ5IHZlcnkg
YmFkLCBzbyB3ZSBzaG91bGQganVzdCBkbyBub3RoaW5nLgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+
Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlIGlmICht
ZW0tPnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX1dDKQo+PiBJJ3ZlIGp1c3QgbnVrZWQgdGhlIFRU
TV9QTF9GTEFHX1dDIGZsYWcgaW4gZHJtLW1pc2MtbmV4dC4gVGhlcmUgaXMgYSBuZXcKPj4gbWVt
LT5idXMuY2FjaGluZyBlbnVtIGFzIHJlcGxhY2VtZW50Lgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdmFkZHJfaW9tZW0gPSBpb3JlbWFwX3djKG1lbS0+YnVzLm9mZnNldCwgc2l6ZSk7
Cj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFk
ZHJfaW9tZW0gPSBpb3JlbWFwKG1lbS0+YnVzLm9mZnNldCwgc2l6ZSk7Cj4+PiArCj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCF2YWRkcl9pb21lbSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRU5PTUVNOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9idWZfbWFwX3Nl
dF92YWRkcl9pb21lbShtYXAsIHZhZGRyX2lvbWVtKTsKPj4+ICsKPj4+ICvCoMKgwqAgfSBlbHNl
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0gewo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmludGVycnVwdGlibGUgPSBmYWxzZSwKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ub193YWl0X2dwdSA9IGZhbHNlCj4+PiArwqDCoMKgwqDC
oMKgwqAgfTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX3R0ICp0dG0gPSBiby0+dHRt
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIHBncHJvdF90IHByb3Q7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
dm9pZCAqdmFkZHI7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgQlVHX09OKCF0dG0pOwo+PiBJ
IHRoaW5rIHdlIGNhbiBkcm9wIHRoaXMsIHBvcHVsYXRlIHdpbGwganVzdCBjcmFzaCBiYWRseSBh
bnl3YXkuCj4+Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gdHRtX3R0X3BvcHVsYXRl
KGJvLT5iZGV2LCB0dG0sICZjdHgpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIC8qCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFdlIG5lZWQgdG8gdXNlIHZtYXAgdG8gZ2V0
IHRoZSBkZXNpcmVkIHBhZ2UgcHJvdGVjdGlvbgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBvciB0
byBtYWtlIHRoZSBidWZmZXIgb2JqZWN0IGxvb2sgY29udGlndW91cy4KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgICovCj4+PiArwqDCoMKgwqDCoMKgwqAgcHJvdCA9IHR0bV9pb19wcm90KG1lbS0+cGxh
Y2VtZW50LCBQQUdFX0tFUk5FTCk7Cj4+IFRoZSBjYWxsaW5nIGNvbnZlbnRpb24gaGFzIGNoYW5n
ZWQgb24gZHJtLW1pc2MtbmV4dCBhcyB3ZWxsLCBidXQgc2hvdWxkCj4+IGJlIHRyaXZpYWwgdG8g
YWRhcHQuCj4+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+ICvCoMKgwqDCoMKgwqDC
oCB2YWRkciA9IHZtYXAodHRtLT5wYWdlcywgYm8tPm51bV9wYWdlcywgMCwgcHJvdCk7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKCF2YWRkcikKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRU5PTUVNOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRtYV9idWZfbWFwX3NldF92
YWRkcihtYXAsIHZhZGRyKTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4g
MDsKPj4+ICt9Cj4+PiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fdm1hcCk7Cj4+PiArCj4+PiArdm9p
ZCB0dG1fYm9fdnVubWFwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCBkbWFf
YnVmX21hcAo+Pj4gKm1hcCkKPj4+ICt7Cj4+PiArwqDCoMKgIGlmIChkbWFfYnVmX21hcF9pc19u
dWxsKG1hcCkpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gKwo+Pj4gK8KgwqDCoCBp
ZiAobWFwLT5pc19pb21lbSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBpb3VubWFwKG1hcC0+dmFkZHJf
aW9tZW0pOwo+Pj4gK8KgwqDCoCBlbHNlCj4+PiArwqDCoMKgwqDCoMKgwqAgdnVubWFwKG1hcC0+
dmFkZHIpOwo+Pj4gK8KgwqDCoCBkbWFfYnVmX21hcF9jbGVhcihtYXApOwo+Pj4gKwo+Pj4gK8Kg
wqDCoCB0dG1fbWVtX2lvX2ZyZWUoYm8tPmJkZXYsICZiby0+bWVtKTsKPj4+ICt9Cj4+PiArRVhQ
T1JUX1NZTUJPTCh0dG1fYm9fdnVubWFwKTsKPj4+ICsKPj4+ICDCoCBzdGF0aWMgaW50IHR0bV9i
b193YWl0X2ZyZWVfbm9kZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGRzdF91c2VfdHQpCj4+PiAgwqAg
ewo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCj4+PiBi
L2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oCj4+PiBpbmRleCAxMThjZWY3NmY4NGYu
LjdjNmQ4NzQ5MTBiOCAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hl
bHBlci5oCj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaAo+Pj4gQEAg
LTEwLDExICsxMCwxNyBAQAo+Pj4gIMKgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19hcGkuaD4K
Pj4+ICDCoCAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+Cj4+PiAgwqAgK3N0cnVj
dCBkbWFfYnVmX21hcDsKPj4+ICsKPj4+ICDCoCAjZGVmaW5lIGRybV9nZW1fdHRtX29mX2dlbShn
ZW1fb2JqKSBcCj4+PiAgwqDCoMKgwqDCoCBjb250YWluZXJfb2YoZ2VtX29iaiwgc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0LCBiYXNlKQo+Pj4gIMKgIMKgIHZvaWQgZHJtX2dlbV90dG1fcHJpbnRf
aW5mbyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHVuc2lnbmVkIGludAo+Pj4gaW5kZW50LAo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpnZW0pOwo+Pj4gK2ludCBkcm1fZ2VtX3R0bV92bWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqZ2VtLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2J1Zl9t
YXAgKm1hcCk7Cj4+PiArdm9pZCBkcm1fZ2VtX3R0bV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpnZW0sCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2J1Zl9tYXAg
Km1hcCk7Cj4+PiAgwqAgaW50IGRybV9nZW1fdHRtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpnZW0sCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSk7Cj4+PiAgwqAgZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmgKPj4+IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4gaW5kZXggMzcxMDJl
NDVlNDk2Li4yYzU5YTc4NTM3NGMgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2FwaS5oCj4+PiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4+PiBAQCAt
NDgsNiArNDgsOCBAQCBzdHJ1Y3QgdHRtX2JvX2dsb2JhbDsKPj4+ICDCoCDCoCBzdHJ1Y3QgdHRt
X2JvX2RldmljZTsKPj4+ICDCoCArc3RydWN0IGRtYV9idWZfbWFwOwo+Pj4gKwo+Pj4gIMKgIHN0
cnVjdCBkcm1fbW1fbm9kZTsKPj4+ICDCoCDCoCBzdHJ1Y3QgdHRtX3BsYWNlbWVudDsKPj4+IEBA
IC00OTQsNiArNDk2LDMyIEBAIGludCB0dG1fYm9fa21hcChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAo+Pj4gdW5zaWduZWQgbG9uZyBzdGFydF9wYWdlLAo+Pj4gIMKgwqAgKi8KPj4+ICDC
oCB2b2lkIHR0bV9ib19rdW5tYXAoc3RydWN0IHR0bV9ib19rbWFwX29iaiAqbWFwKTsKPj4+ICDC
oCArLyoqCj4+PiArICogdHRtX2JvX3ZtYXAKPj4+ICsgKgo+Pj4gKyAqIEBibzogVGhlIGJ1ZmZl
ciBvYmplY3QuCj4+PiArICogQG1hcDogcG9pbnRlciB0byBhIHN0cnVjdCBkbWFfYnVmX21hcCBy
ZXByZXNlbnRpbmcgdGhlIG1hcC4KPj4+ICsgKgo+Pj4gKyAqIFNldHMgdXAgYSBrZXJuZWwgdmly
dHVhbCBtYXBwaW5nLCB1c2luZyBpb3JlbWFwIG9yIHZtYXAgdG8gdGhlCj4+PiArICogZGF0YSBp
biB0aGUgYnVmZmVyIG9iamVjdC4gVGhlIHBhcmFtZXRlciBAbWFwIHJldHVybnMgdGhlIHZpcnR1
YWwKPj4+ICsgKiBhZGRyZXNzIGFzIHN0cnVjdCBkbWFfYnVmX21hcC4gVW5tYXAgdGhlIGJ1ZmZl
ciB3aXRoIHR0bV9ib192dW5tYXAoKS4KPj4+ICsgKgo+Pj4gKyAqIFJldHVybnMKPj4+ICsgKiAt
RU5PTUVNOiBPdXQgb2YgbWVtb3J5Lgo+Pj4gKyAqIC1FSU5WQUw6IEludmFsaWQgcmFuZ2UuCj4+
PiArICovCj4+PiAraW50IHR0bV9ib192bWFwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
IHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKTsKPj4+ICsKPj4+ICsvKioKPj4+ICsgKiB0dG1fYm9f
dnVubWFwCj4+PiArICoKPj4+ICsgKiBAYm86IFRoZSBidWZmZXIgb2JqZWN0Lgo+Pj4gKyAqIEBt
YXA6IE9iamVjdCBkZXNjcmliaW5nIHRoZSBtYXAgdG8gdW5tYXAuCj4+PiArICoKPj4+ICsgKiBV
bm1hcHMgYSBrZXJuZWwgbWFwIHNldCB1cCBieSB0dG1fYm9fdm1hcCgpLgo+Pj4gKyAqLwo+Pj4g
K3ZvaWQgdHRtX2JvX3Z1bm1hcChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3Qg
ZG1hX2J1Zl9tYXAKPj4+ICptYXApOwo+Pj4gKwo+Pj4gIMKgIC8qKgo+Pj4gIMKgwqAgKiB0dG1f
Ym9fbW1hcF9vYmogLSBtbWFwIG1lbW9yeSBiYWNrZWQgYnkgYSB0dG0gYnVmZmVyIG9iamVjdC4K
Pj4+ICDCoMKgICoKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgg
Yi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgKPj4+IGluZGV4IGZkMWFiYTU0NWZkZi4uMmU4
YmJlY2I1MDkxIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLW1hcC5oCj4+
PiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgKPj4+IEBAIC00NSw2ICs0NSwxMiBA
QAo+Pj4gIMKgwqAgKgo+Pj4gIMKgwqAgKsKgwqDCoCBkbWFfYnVmX21hcF9zZXRfdmFkZHIoJm1h
cC4gMHhkZWFkYmVhZik7Cj4+PiAgwqDCoCAqCj4+PiArICogVG8gc2V0IGFuIGFkZHJlc3MgaW4g
SS9PIG1lbW9yeSwgdXNlIGRtYV9idWZfbWFwX3NldF92YWRkcl9pb21lbSgpLgo+Pj4gKyAqCj4+
PiArICogLi4gY29kZS1ibG9jazo6IGMKPj4+ICsgKgo+Pj4gKyAqwqDCoMKgIGRtYV9idWZfbWFw
X3NldF92YWRkcl9pb21lbSgmbWFwLiAweGRlYWRiZWFmKTsKPj4+ICsgKgo+Pj4gIMKgwqAgKiBU
ZXN0IGlmIGEgbWFwcGluZyBpcyB2YWxpZCB3aXRoIGVpdGhlciBkbWFfYnVmX21hcF9pc19zZXQo
KSBvcgo+Pj4gIMKgwqAgKiBkbWFfYnVmX21hcF9pc19udWxsKCkuCj4+PiAgwqDCoCAqCj4+PiBA
QCAtMTE4LDYgKzEyNCwyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2J1Zl9tYXBfc2V0X3Zh
ZGRyKHN0cnVjdAo+Pj4gZG1hX2J1Zl9tYXAgKm1hcCwgdm9pZCAqdmFkZHIpCj4+PiAgwqDCoMKg
wqDCoCBtYXAtPmlzX2lvbWVtID0gZmFsc2U7Cj4+PiAgwqAgfQo+Pj4gIMKgICsvKioKPj4+ICsg
KiBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0gLSBTZXRzIGEgZG1hLWJ1ZiBtYXBwaW5nIHN0
cnVjdHVyZSB0bwo+Pj4gYW4gYWRkcmVzcyBpbiBJL08gbWVtb3J5Cj4+PiArICogQG1hcDrCoMKg
wqDCoMKgwqDCoCBUaGUgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQo+Pj4gKyAqIEB2YWRkcl9p
b21lbTrCoMKgwqAgQW4gSS9PLW1lbW9yeSBhZGRyZXNzCj4+PiArICoKPj4+ICsgKiBTZXRzIHRo
ZSBhZGRyZXNzIGFuZCB0aGUgSS9PLW1lbW9yeSBmbGFnLgo+Pj4gKyAqLwo+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oc3RydWN0IGRtYV9idWZfbWFw
ICptYXAsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2b2lkIF9faW9tZW0gKnZhZGRyX2lvbWVtKQo+Pj4gK3sKPj4+ICvCoMKgwqAgbWFw
LT52YWRkcl9pb21lbSA9IHZhZGRyX2lvbWVtOwo+Pj4gK8KgwqDCoCBtYXAtPmlzX2lvbWVtID0g
dHJ1ZTsKPj4+ICt9Cj4+PiArCj4+PiAgwqAgLyoqCj4+PiAgwqDCoCAqIGRtYV9idWZfbWFwX2lz
X2VxdWFsIC0gQ29tcGFyZXMgdHdvIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmVzCj4+PiBmb3Ig
ZXF1YWxpdHkKPj4+ICDCoMKgICogQGxoczrCoMKgwqAgVGhlIGRtYS1idWYgbWFwcGluZyBzdHJ1
Y3R1cmUKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5m
byUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5j
b20lN0MwN2JjNjhhZjNjNjQ0MGI1YmU4ZDA4ZDg3NDBlOWIzMiU3QzNkZDg5NjFmZTQ4ODRlNjA4
ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczODY5NTM0MzM1NTg1OTUlN0NVbmtub3duJTdD
VFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJ
azFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9UmxHQ21qenlaRVJ2cWZubDRr
QTFiRUhlejVia0xmM0Y5T2xLaTJ5YkRBTSUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
