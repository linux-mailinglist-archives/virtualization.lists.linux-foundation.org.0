Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBD5BDDA6
	for <lists.virtualization@lfdr.de>; Tue, 20 Sep 2022 08:50:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3262E410D1;
	Tue, 20 Sep 2022 06:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3262E410D1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JDp4tqAn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9I3xZ3nKXrZ; Tue, 20 Sep 2022 06:50:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B17AE410CB;
	Tue, 20 Sep 2022 06:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17AE410CB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA9BFC0077;
	Tue, 20 Sep 2022 06:50:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFE0DC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 06:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C430404CF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 06:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C430404CF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=JDp4tqAn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7xuJeNXUGQW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 06:50:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63C8F401AF
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63C8F401AF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663656637; x=1695192637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pp9jNAEQRvcbXnHZioEzinbVZ0ENnKiZRVzhj1Xh23A=;
 b=JDp4tqAnwe1OeYJUCCzQ4i8Vc8JGtxUDXkx2VB8+iR5Ur6aS4Zb9hUnz
 mvQELxfjyT9HVUzhLxV7kYgKx6aFhJ26+GtfC0X6f+dPPnp3ZlwtOWn43
 xgpaVN1Y+H0ICULp6LAAUykV6/XVgG6JGMdEWmajmqfHO6Jg9fmhZjVcS
 eFpvVdE1d4pj7Go+zZXZbM6OEbgmQVSmxLQhbjOovM0wZQ/3q5c52Eibg
 lyJ8roV1BXeryWfC1LM1rQt+N6T8cUcMoHcVqtV48MUYnUmlpWEbJCZgh
 Va7xlQ9cB0kf3kf9nssCSdwttJR+mQRFQM1xgoRJXnLU75cTSRIi95EdL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="363573789"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="363573789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 23:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="621148415"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2022 23:50:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 23:50:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 23:50:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 23:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWStvvX3zDZF9kHd1L6Btnqxi2i73D+WV7QKiVxnuF1y2B3BrQt7Bw/U+Y/yzb9XXQ5pCwnU1fRJRJ0XbiUyZMaOF050jcvBTT13WTX9D14lPBw48tlV8+HR1dvzqvWw8CDWZMWbDnrPVSNGg6Wut80hFeEHyPWhRWd6D3rsOT0b+/moGw18TMG7tdxrDcVBvmimUAaoVGl9iCzo5jJ8D18fyssmBqVg1sV8DiBZg3uw6ihplFvZX33gfLMf0oCASO15Bzv0IurUEzrvXq+mcDGz7Jv/xraR2gqJA6egl+FCzGrj8/1mgyo8sMLLuoba1wxLHfglRJMt5BK0a9eXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pp9jNAEQRvcbXnHZioEzinbVZ0ENnKiZRVzhj1Xh23A=;
 b=g5Tik0Oi+oD/IA/uNeVl1bksd15Kbx5luthyX8U+pr1pl/IhHXN3aHEpluqqu1S19dN/0NL7Rmb06byKfbmKriZjI/mrfznDmqc/pagOcF/aiq9Zy1j0iUa8LRdd2CWQwzMOLTMJ1UKN71iuK8qiV54eTcQHGZJ5YJ4U0tFA+YMESZuc1l7+Nh8E0ZL48r/ypiB/HkKDz8J1i/cOqL85HiH7Aqa8Vmh4ax076ksKzw61XOQ9uHHNGYADACzFfU9lQNlGjKpE+kaZdNPweILcT/ndCt8HxJQBL9X4AVGeTMBkwCZXrEIKY5RnI7uDaAvuRXyLjwEigR2S1ngeuyiAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB6170.namprd11.prod.outlook.com (2603:10b6:208:3ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 06:50:22 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%6]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 06:50:22 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "yong.wu@mediatek.com"
 <yong.wu@mediatek.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>
Subject: RE: [PATCH v3 6/6] iommu: Propagate ret for a potential soft failure
 EINVAL
Thread-Topic: [PATCH v3 6/6] iommu: Propagate ret for a potential soft failure
 EINVAL
Thread-Index: AQHYyNkR54Kleox4l0iaXVzdnjSr3K3n5cEA
Date: Tue, 20 Sep 2022 06:50:22 +0000
Message-ID: <BN9PR11MB5276A69368B6E06E2C86EA058C4C9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1663227492.git.nicolinc@nvidia.com>
 <cd613152e5175b5ffac643ee017b1d800e766d99.1663227492.git.nicolinc@nvidia.com>
In-Reply-To: <cd613152e5175b5ffac643ee017b1d800e766d99.1663227492.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB6170:EE_
x-ms-office365-filtering-correlation-id: 0a9f193c-0441-4f34-804e-08da9ad463b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IlwX+nkx5kHBr64wYeREHvbJH68Ydahy52tT/zqx1Z4/Ig3vJTCbZ86iXDzUNiRQwlvZSAc+Blg2bMn0aUNP6148LS/GqMCH5EjcLMzqQeW7OffaxIT2pibAzKHX+8HcpO5Vx5P1Q7CvJlPoS2Y8IyA+JPJKFMKGZYYloc0LxKoxOgK2qiI1abLJ9vnspfa+FcbZjvwakJARUDFFNAtAay3V8O1zR5sMeXDDcs9lf3rDUUQXe4okqKmPpdpah/qFS6I99wkpMBd2CU1lVTmFfLO5kn+u95s30TMVqq1Nc45Wc+Ix6ao4PY7mR/jNT7c95hgFjfJYA+I2IT/A0CIQmys6tVd/HJlr/fXuuU0PqO+2UreU+TE31Yd71YS7z/h7ymk8BqmEzz4UO7N2Xx1i7SNnV0hevosXeymFQrdNnllLYYeVgzt669GKnfYZFjrgoSRnYPtSiPrfX9v6k2LPOJ8wxwhNVV8LsZMZxZl+BeLIRnroA5kDFLWAkPmFMBmZPYHl0VK4z0sCUX9745iAKJ3+zSIHCxWeYIXnSoLiS5OUtLFqThyUnNLUVR513JsehFjMVXI6CMXyfxjPvpdj63wjjx31GxS/N7qVJl5XH3n7T1b4SSFynrtITC4Iw/AQG1AX3xhh3OaX9ogx3ebIrv4NkfOJy5g5h696/v2DgX/Ds1AG4OmVDmqrtFRA+otRxaWXwlXp1aIGXJnp2mGtGUnZnOtOOBrZkBfSjf58hpBDA8nFPck97tUJchdkvhgVhW3aZlthbK+oI25jT4uqog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199015)(83380400001)(2906002)(8676002)(54906003)(110136005)(4744005)(5660300002)(52536014)(76116006)(33656002)(4326008)(64756008)(66446008)(66476007)(66556008)(316002)(66946007)(478600001)(86362001)(41300700001)(7416002)(71200400001)(8936002)(6506007)(7696005)(186003)(9686003)(26005)(38070700005)(55016003)(38100700002)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7Fd2TdU+cjpn/yRd1zKW0fdgeGIs754ElLos2G7JIeY8zhn7JM57EG6M5pbE?=
 =?us-ascii?Q?2cgA8sIriMZUGr4rm/NYI4Faufi4yMRM3ApSav/RQIm6wnpyWpudkunkvSvJ?=
 =?us-ascii?Q?giMxGGgjMN71P1ZEatAyXYMDMc6zGnikmgZwejmVYwfM5DScZPdZlRJ8af7G?=
 =?us-ascii?Q?kCGyolp6SiMoXfMQ9OA37BrhLW5v8Elf3cOCNEYqof7iuskaThuyeWgdicVE?=
 =?us-ascii?Q?lzWQzdkcXMWcwOGHZX0/R5qy8nb1ayyAIXG/SsVjYSTW/xNK+fyhH5Ia+ENB?=
 =?us-ascii?Q?A/2DOWXxeolJrWEX9kyv0NH0GmbY54i0T1eMPBdmyz5SQ9kCcZ/TmGI7RkOO?=
 =?us-ascii?Q?QSzsfS58N3EgEqSTTd0eCeLwS0t2wDjd8yFoqTz494XMjPb88ICfQgyQ0X4S?=
 =?us-ascii?Q?8oAQMtkjkm3fAsLrdRx/mYFIiVf5Nb1ovX2MAh+mG4wsJdCFuqhMfeM+IZj+?=
 =?us-ascii?Q?c8kAihwc3IvWAzC6+sL2eQPZVRJWN+bDgIwabTVBXS5hl4CeAw7tx+xaSzVa?=
 =?us-ascii?Q?UR9VixkP3TvAgwZipxjV0I5NM4KWZXlzrYK6A45TU01YnuGcft7lAtZqLj7P?=
 =?us-ascii?Q?2eefhj8cVLjBnIeXcLe7YUt1IhOHQqJZwixWfBnMNXVOJehwgIkdBZBDhOVd?=
 =?us-ascii?Q?KYhKXOA5mb5JjUjj3pg8N55MC2owHKtfgv7eDWcdyF5NJnTr8Tl7nXwZT+Yw?=
 =?us-ascii?Q?3TjcrFDkCeLtw8e9fuFtZrduR1XsUlS3/WSApZUlRnmzE0EzIeBTV8KPtjaB?=
 =?us-ascii?Q?Ms3ESMC+gx2U5d4RM6Bc6f5FqmM8Csih56h1REm3aThb9LweVfNEoUpAEdbn?=
 =?us-ascii?Q?x4bXpbtawaPeCo1xqqsxHNQVtVVEZe/W1g6s+vWXgB126WaDnX3ieHPbfW6q?=
 =?us-ascii?Q?Di5diuxHQ2CwBls2jLLdO5muLk8lWHLod30kEkhyggtZtwNshFbeFc3f6kcy?=
 =?us-ascii?Q?382cOITp/Mto5Jfv9TsEJ/88RU9ibhaP+WpQ3ELUrrYw0lebnbugGR+pqhpe?=
 =?us-ascii?Q?/RPaj/PtcakNNCvf1WpIQ4T0ji3HH2/GvCBnL7yIrefg7jIlGD7imrqVbDUg?=
 =?us-ascii?Q?WAyfI6zvuISi+TZ4P5ZFdgiMIjTH6b8Wa2ENeJict0mJDQLGk3+wAhe7O+jJ?=
 =?us-ascii?Q?sH3mZr6fH4718h5YmPC6MSniR2OB9jxminJ3Z3XwMgcxspxOMs0S3No2Dw4i?=
 =?us-ascii?Q?IsFIlB8pkEbD2xhqEGvyFFJqCoRZsqNOv0I6ntfNZ1qSvV1tmpNV8Fp830PT?=
 =?us-ascii?Q?84Khaxaae6HIzFI/ngdHnjXlkx5xW/E9AVHdYE9bjJrkStPlK/6dR6KNHAb/?=
 =?us-ascii?Q?DMWXKOfTVgZa9VlZu/Sh/+y+umN9GHKafe+r/ooKZRAEw/vof2uu7uI1JYjC?=
 =?us-ascii?Q?ICySxoNiLIOA3GA6+8l8mpMdeG3wu5op8LIgHQKwAC0V0PpVsSkb0QQF4+Gh?=
 =?us-ascii?Q?RWJlnaJUGbsRimDjCkIY0PpYr/3M3D5puaYn5p5ORAvnsZI+/+fB+wokwSeE?=
 =?us-ascii?Q?T8awXY8Ltvqa+aMjtzUInhZUFk5MKP2BPjIreTQtAu8WUMd7WGngl99ATHEt?=
 =?us-ascii?Q?yfXkO50V0WaT4phHFE/KRB0P0tc9SH5/nu1PA5TX?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9f193c-0441-4f34-804e-08da9ad463b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 06:50:22.2436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpdTqpWTkQprTT7z60Jeq55LOuRaNABICCcKSFNu8JvAVjvPI+/2rXcAkgS8P4LdOJB4bwedZLJ2GCAqzT5n1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6170
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
> Sent: Thursday, September 15, 2022 3:59 PM
> 
> Following the new rules in include/linux/iommu.h kdocs, EINVAL now can be
> used to indicate that domain and device are incompatible by a caller that
> treats it as a soft failure and tries attaching to another domain.
> 
> Either mtk_iommu or virtio driver has a place that returns a hard failure
> instead of the return value from the function call, where an incompatible
> errno EINVAL could potentially occur.

in both cases there is no EINVAL returned from the calling stack

IMHO error propagation is the right way even w/o talking about EINVAL
otherwise we may miss ENOMEM etc.

> 
> Propagate the real return value to not miss a potential soft failure.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Apart from that comment,

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
