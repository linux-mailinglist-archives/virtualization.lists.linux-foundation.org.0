Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F10308435
	for <lists.virtualization@lfdr.de>; Fri, 29 Jan 2021 04:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 10A9C204ED;
	Fri, 29 Jan 2021 03:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-RVyCG-dnFc; Fri, 29 Jan 2021 03:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 74EC4203D0;
	Fri, 29 Jan 2021 03:24:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BE19C08A1;
	Fri, 29 Jan 2021 03:24:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDA37C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 03:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BC2BA8699C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 03:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuJ-7O8WH5pq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 03:24:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 92CF686910
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 03:24:00 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60137fd00000>; Thu, 28 Jan 2021 19:24:00 -0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 03:23:59 +0000
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 03:23:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 29 Jan 2021 03:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtLGryifyQqv/eYFA+whkktxKG3bngKTExcE+ZnOHHb+mnG66CrFRVkyO+pGHn+/YK7+c5oYgKh+IN76IDl8aV4EnaGC+4J8AoAhpqBEkDvfxsELeoX562rhZft1KBimv04uRN0tQ7GA5PhK2KDx6JFzYIann6Tk71yg1yK3L9FUBtrNzUiBVk05zI7VxF5nBYW/2eJhdNJrtXe1i+vh78GNASH87yNPodqeluxYyPkEF8SaXhlUZ6jyl3xJvNM0Jo/BwCI8IShpEajnlb1EJioYS1RVCj0EwKsRs7Y4+71kDM2NivmbulDTx0DPM5hOKRxLaqE5/8/7L4qjI+h5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLIbFzg/NssccmqkR2wEiHPGW2cXH0MfYEuJbhvnWRk=;
 b=MkA6Jx07+8r0FbDwMiffB3OaMU8VGQPklKAtSbOBMIaoRE65Sq7fEqAmgfswTQHHEcF/TUN32NJDM4hcBjSwqWLfspwxpAgRCXGzsPUt+nY7aT9ee3G/In1CNN1JortPJ+N3aiRIOn/qsug9x+/Q4y4LGcHwcChJ9GT1ha3XIrAt4P+fL+qCZr9e3YYBTzs8ILyeW4of53Pc0eJJbU65ccFUnHVYTsUh6Up/+70b9HDw7vF/Zd+uevbXbFeCY2rO/3ZGQfsmPjphWQwo5ILjiGBddWFFRe9eznX7z1AeCF6bhiIK2abWaFgR4ZsFMxGZYaiZT6zd9hnKRBR5mkakuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 03:23:56 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::f9f4:8fdd:8e2a:67a4]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::f9f4:8fdd:8e2a:67a4%3]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 03:23:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dsahern@gmail.com" <dsahern@gmail.com>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>, "mst@redhat.com"
 <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>
Subject: RE: [PATCH iproute2-next v2 2/2] vdpa: Add vdpa tool
Thread-Topic: [PATCH iproute2-next v2 2/2] vdpa: Add vdpa tool
Thread-Index: AQHW9aV+fFpYJbYO/06jl1++glI1tqo98BUA
Date: Fri, 29 Jan 2021 03:23:55 +0000
Message-ID: <BY5PR12MB4322B0267D59A5F49F28CA2BDCB99@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20210122112654.9593-3-parav@nvidia.com>
 <20210128184319.29174-1-parav@nvidia.com>
 <20210128184319.29174-3-parav@nvidia.com>
In-Reply-To: <20210128184319.29174-3-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [122.167.131.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b42a6283-58c1-4bcd-51b9-08d8c4054f6b
x-ms-traffictypediagnostic: BY5PR12MB4243:
x-microsoft-antispam-prvs: <BY5PR12MB4243C3221AB63F10C1F35E8DDCB99@BY5PR12MB4243.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Y+NpeAQVEVkDi18PW+dnR3IK6JYXGuYhrDbJzrISE6WJVnHvcva8t8TT3y/EKxuMTbyEpC/7FVFAcIOgC43p5+S5cL8flkD2D9FZ1KI2qgS1LY86MRqUIOWAgnXHTkFKsHHMUSyONpwfr5FNznRIhU+B1TLYL4OHJ8XNybXsPSeU4cTXR+iI5GGj2cF3IE3yCdFf34m0PnJ3U1TKG8bRWABgI9TxwyxM2i52yLlhthfFMXmtktuVm84G3s4/2LkTqHHVQRiFrWIUXlDlvzRWznGOJZXtD7THNv8CKrfdtc6UkUa5tvR1sfVM/D0xojMREbEBI1zrxfWumzKOkeaqlAnjVv0rUIkR6HuXke6k52jzNvQDEA8tG7J8HqeMeEr4dSztarAFTxHaQ299q5s3pg2r2b3XHY+R0ZNGMrXGdt4cxj1OC82Z8NS8qUrjPA+gbKKrp8xxB7TpcIdGhUhO6eiqO7up0se5ExWaAJPOpyuK3f2qgRpEB4YigcGZQMJa9HenrsVyuRu4hyuW/I4kA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(8936002)(7696005)(8676002)(110136005)(5660300002)(6506007)(33656002)(9686003)(478600001)(316002)(52536014)(4744005)(66556008)(86362001)(64756008)(186003)(26005)(66476007)(71200400001)(2906002)(55016002)(66446008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jsC74D6R5Fqp66D2lfjob7CdTyCl0T9eQswq6T+A1otRXr6X3IzZ45tfGq0i?=
 =?us-ascii?Q?a7OjuYFC35//WVTES9kEO5C0ibQYhGGb5czbqKB0HflAOdIBKWQEFqCj/Xmb?=
 =?us-ascii?Q?leg60llDQ7wIt/DWsWjLST2zimQiMF9WXyi7n8pqmhuDZIXwxhCZPYrMwMuH?=
 =?us-ascii?Q?rddnHY38vWPao8zAZ5vCkt3senrPqwc4MO9lHuwBWwTrrZMVWDmtp8qE499x?=
 =?us-ascii?Q?a+K+V3ec0LJC5oUW31hE1HcZYSAmvLKhi9S57y7FFzTOo5J67GRxanPhod8g?=
 =?us-ascii?Q?LfFlKVxWBXy+hvJerdC4sM2J3vxA6Jm9KcniN9Bp2sDLN1H5SBbj8okRwB8c?=
 =?us-ascii?Q?vhKneDS8aO92zBzljdcbM9UkqrOHl5k7H5a0i9lQqU8kPFzGwJkR9JUVsz8C?=
 =?us-ascii?Q?JIqpWLY+GkCHE5fzc7aDKMM8mnQHQYB1/3hcp5MRGVs6mWvgVKGb1d803vf1?=
 =?us-ascii?Q?FOMLGj+EjDfjF9ORSfz9BaCVZiD3GdqZttqXmt3nCpiyDIx0GLra1002YgSa?=
 =?us-ascii?Q?EhZc7IfljBembeEJc18S+P3/rJcAL/A7H8HpA7+eXgUBdNi/TF3JxIGCI6pC?=
 =?us-ascii?Q?11LVMCzpnwVYsU/t8nu3zikZXqW+HicvYuoqquwZZELHbSCkq5t5xPX30oF/?=
 =?us-ascii?Q?F5F2iWxEiWEJtAFplPQBAdliodDHD8zuUzQAgbKCQWMxNNU8Mvtrk/rjKZ8f?=
 =?us-ascii?Q?urrTszvEwBh/MRl0piq7hRFNdQE9/zp8X7gKaXM+z/+8P/Jenm69ere85bqa?=
 =?us-ascii?Q?aW5YNNjvxK9ev2MdU0mBsFas2GRQKMmlsjtCvqDuU0lMm8+61qjs/AIK1cia?=
 =?us-ascii?Q?eJWTzhxk1kj4EJ5b07Ch7lC3ieGJrnbOf3aMUDkSjp2uXqwbAJHZu/tEkJ/R?=
 =?us-ascii?Q?4nnePP3UB73kAFmN17QwmTrjJVsxPjiRQNd3qC3vfSXG5NGPb8Y9ZusaXavw?=
 =?us-ascii?Q?LzOvxxosNY7WYNMt9fuY6p3c0JherQuvct3o752a3kGVUQZw8gVib9wujjmR?=
 =?us-ascii?Q?L/CimKNJ8F7sapAUQyk7LFFfd+fasW8fYpjj1z0rr6jHRbQw9LbF4BO+Jcn2?=
 =?us-ascii?Q?apHAIgsh?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42a6283-58c1-4bcd-51b9-08d8c4054f6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 03:23:55.8492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEgOEwF8j0B30UgUJizviPelow+EcIRJilR/9tfSruxn+gSC2TKVG7Ey9AppO1v0+mF/4hd+NrbUrqqAOtcWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611890640; bh=eLIbFzg/NssccmqkR2wEiHPGW2cXH0MfYEuJbhvnWRk=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
 x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
 x-ms-exchange-transport-forked:Content-Type:
 Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=WUmS+bJwJtd4kJpM3eUzwUJV/AvnNWuL2V7sGN7B8dvfGVdSGPYWpJ6bt/rzotGxM
 Kfb4yRW8X4KWmYj7a1YEapi9iopRpRppRwKDDkbVjeKeYOrlxxOmuTl/V6fzfHdFOE
 fTHFuV3AV7J9fN+NKVDFKzZirgRb9CS/RhZ8g/89uXmvSPAa6mhOqeLarjRREeMwNF
 T6zVQGnR1a2822cTkNWS4p23VhwpboOxdtjXEfDTzSQkZxOwMyH54T9I+Tj7NUgi8/
 Ri8x//GD6CZkUG4q3dQ8nWNhgzrRgg2h9TBAcYABEyRfvI8dr6TTmbxwGegYjrG6Ht
 Y6JYF2GaZznrg==
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

Hi David,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, January 29, 2021 12:13 AM

[..]

> ---
> changelog:
> v1->v2:
>  - added and used library helpers for socket communication
>  - added and used library functions for string processing helpers
>  - added and used library functions indent processing helpers

I have converted devlink to also using string processing and socket helpers and initial round of test.
However it needs more testing.
And I patchset for devlink subfunction plumbing in direct conflict with this new socket APIs.
So I will finish devlink conversion to use library routines post taking care of the subfunction.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
