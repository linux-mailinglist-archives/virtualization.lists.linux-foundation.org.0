Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E75020E7
	for <lists.virtualization@lfdr.de>; Fri, 15 Apr 2022 05:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F04E8840F3;
	Fri, 15 Apr 2022 03:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swdsf1VHxAyg; Fri, 15 Apr 2022 03:33:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A5BBA84068;
	Fri, 15 Apr 2022 03:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2CFC0085;
	Fri, 15 Apr 2022 03:33:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3434C002C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 03:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2BA460FF4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 03:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=microsoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2MP59KzOnjo
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 03:33:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7773760FF3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 03:33:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPuJnNqCnKav1Fo2MPE5lRANUuky4F+XCHoqQ5SUXGqvYhZIfySJA0WtMvCrAaxOwq3zyuQHfrv6z8IqrLEX5mxCacJwJtdpBP6zHvhPGCj1A5fPABP9vvqZ1O+E++ueENfa/K0nfnS9BlkrRt9sECGLNg9GXNlresmErVNWiCzGv0X7tcu+1SR1tKTPGY9DYp9KS6+KqKL/ynjEKrsJoPFmQJ639nC9C4qVc7kkWDVE+OoZnUCChBUIXXFjvn7tEMnGRo7e/FtnM2s8EHHU+th3tVISd5ktMG6FuF3V0MOomttIty4gTRi6mvSYaqCYEpZQ8LXBel528adguuGg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/epHBsExLVb9EAU8jgqRSygmd6d4K0oiVUIWjNj9Okg=;
 b=VVIYqqYf5xQGB1XONyqL7S/jJuEXDNJ84M6Zu/UZsDnbX6kvVB1uo4/tVuSSL7MoJraJ0nyoryqeDd4gq/lXrofENxhiSr5Py0zYSXqoNFBIa0/aA7yUld45lGYmYaldlFvOpIkmz4JQ8tKrj9nLh2Js02pzlLnBj8QbSQBrOe3XgnfvuCBUUqV4CUJ7yvRJaHW3GAojVMXc+hrh5WDveumFJ1LycrCn5UfericSWkUH/O0BNgvmMaOuo4qGdOe1fSPNa+yb00xOTduqLsxgQNqw/SnPPTcw6K6+Nx4sxB0pIIfD+xxqKbeDJVQxqoHott3nfVRoCz/iSylxd9bxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/epHBsExLVb9EAU8jgqRSygmd6d4K0oiVUIWjNj9Okg=;
 b=hc6H1Os6uKPMz+spzaPC80AG/S/XNx58GCbK7eL8xmKZMQGkKLuQqiWON+DavIcbaLLhrVbOkA1Xb0h6kPVuE6WaT5KjZames/q+peq3p452YSVfS/ayz8a5mHXBovWOHLrZZVheyz4kQH/JTnR6BUhUkaH9suxwgoOtz6lRzls=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by BL1PR21MB3256.namprd21.prod.outlook.com (2603:10b6:208:398::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.6; Fri, 15 Apr
 2022 03:33:51 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::ac09:6e1b:de72:2b2f]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::ac09:6e1b:de72:2b2f%9]) with mapi id 15.20.5186.009; Fri, 15 Apr 2022
 03:33:51 +0000
To: "Andrea Parri (Microsoft)" <parri.andrea@gmail.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Stefano Garzarella <sgarzare@redhat.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Subject: RE: [RFC PATCH 5/6] Drivers: hv: vmbus: Accept hv_sock offers in
 isolated guests
Thread-Topic: [RFC PATCH 5/6] Drivers: hv: vmbus: Accept hv_sock offers in
 isolated guests
Thread-Index: AQHYT3fK2ws+DA6p6kW551q1RVucbqzvs4Rg
Date: Fri, 15 Apr 2022 03:33:51 +0000
Message-ID: <PH0PR21MB302520562EED77A587340D1DD7EE9@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220413204742.5539-1-parri.andrea@gmail.com>
 <20220413204742.5539-6-parri.andrea@gmail.com>
In-Reply-To: <20220413204742.5539-6-parri.andrea@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c2f34053-77b8-4de7-99ab-ba94a8fd0e5e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-04-14T17:58:20Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56e66524-622c-4f9a-0806-08da1e90c283
x-ms-traffictypediagnostic: BL1PR21MB3256:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BL1PR21MB3256CC2E93547EC3296E0019D7EE9@BL1PR21MB3256.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HunbN+0V07XetfXtraKUXVKtTv/aNMzUg33gd9910B1pybj1B4p5ELy0RDns0YsubrD/BUbFCY49K4bPnkagYVtWkubfI5UlLmAN/U4L4DeyyxE0PowwxsfWTVZiPXrrFwxr0lxnEyrJRMzpDmSrQLjrbSXV5jFJEbjFOCt5jtVStZ7OQpSYRcBkhXDKUqsDJ1d6o34AWVt9TvSoemNjAu1uw3io5ocVP69AaZv03aCq+hPmmTjDrtlNCcGlNphz2MEHtt4WbwyLZO2RwZg6oLuwcg+zm5/OBcWTSLsOTrOyxxO4ynDg5429GySnGBq0URACHboMWeMuzrCqXmeZ+aCQEGFodEPxqv5ypYDyYjLBYWkDc0BzKOGGxcXkoLGBjguqipZ8/kfGT96P2DppQCJZhguduomNR+73BbVePAscEpaz8XUjCZSHlzBnEaprGRbvZr1URfXmaiN2RLRwTHEGklpnJwoer4jNu0HicW5jVODLoNjL6zzoEA/nb/3RTn86iPHb4bZuYCyzxkecg70mNGudkQAK+Qgfkkk9Ke/ACd1Wl48D43ilUNDWGiwOmn06xuMrggSnywApYULnO+SJT5DfmYEE58Caxn/8WaOTorcbfcwiGijuXRhPrzM1zE6BBbl4GEXcifiHjTCvSbTMEWdgm5F0NhZrDBV7J+d2BbWRAr9I0kxKuBYnw9fDsXDOf5ZGm4inNOH1K5QJDtJzHn9c8vXswCqENDShGEIGqnQ3yiz1kFqhVVHBSkUpAgSmtO62Tm2gpu9BcyLk1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(508600001)(921005)(55016003)(82950400001)(82960400001)(38100700002)(38070700005)(10290500003)(66476007)(7696005)(122000001)(6506007)(316002)(66556008)(66946007)(54906003)(110136005)(71200400001)(76116006)(4326008)(66446008)(64756008)(8676002)(86362001)(52536014)(8990500004)(83380400001)(33656002)(7416002)(5660300002)(8936002)(2906002)(186003)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p8DgVcyU1SWIoA1Q+h90flc/iLBhSyQXUXkaW3B2giu8wxyPWqxUrWmhd8mO?=
 =?us-ascii?Q?cWWHx8fPJhUKNpL3HHIViRFZKuqV1Je9fmv9ODFDG9mAaQ8I4GAzxaPB5eNA?=
 =?us-ascii?Q?HRMvNMi80DzM8WPtpU+lJanpdkulSycZcfvmyNkSSTB5a7zhr3NNAzz/cIKR?=
 =?us-ascii?Q?ZdHUkvITzcxA2sLkD2bnyGnLm/nMJRz/dDvaxcLOWcqGTpe/ZYaKVq3hpUpC?=
 =?us-ascii?Q?uaUg71YfpvWdVC5fi+W9LK1PEoaLOMbtNqbVy0ym54c/dMx63707YlhWD3yO?=
 =?us-ascii?Q?dXCBOqaYvSoTdR3HwkfSx/yrFcHpHRCfKTsvvP3XbuVBcLsFMI7PJ/Q/r3h5?=
 =?us-ascii?Q?dxQf7EvObLRF0wnsFM3kdyESNvEJk0pYsLLFs98GJtNPL1/gSJA8rT9gLqHR?=
 =?us-ascii?Q?P3u/D/joZz/4BXpKlfkHHtU9bGPkKu12yo/Kt3dZ5A6z307bmS42ePGWC979?=
 =?us-ascii?Q?XkmZdkVqi/5Wfg1DAZ33z4y+Wiz6J1TQgiKdFwL0NgoB/7RA8Z8Fhz9goawT?=
 =?us-ascii?Q?DudTushvj5p/VuCUZ5Rl4+cirHoyT3AsrxsSWvHwwtzvstbGwQVxSfnQ14G5?=
 =?us-ascii?Q?cbvD2hUQCTfRr8H2Ewm+rATwsrRjS028PtHpzmS2C0/whvqCFkDLd14eA/9f?=
 =?us-ascii?Q?Um6wLVNKCfcj3qyCKj74c+52z1b8fCmtQsFokO9MOnDfbeS43ObA52Snnxji?=
 =?us-ascii?Q?ydKRdy+4NQ6039PeLG+fPC3nwcZLw/fCkVfztVhCTEadDGbOBnmR6Qeg7zy2?=
 =?us-ascii?Q?8ElxwFSnazkn2NwKbxJZ1eMx3otEUNln6jc+80RtXMK59M9vSXl2h6yCJBTu?=
 =?us-ascii?Q?x2FT6Mt8h4DMfOa0ZKmo+GNCmALz+cTjid4bD2thT2qeFHHkvd+v4MQmsMz9?=
 =?us-ascii?Q?wyShcBiBWSh6Gg5ryvTLpJ0mh1Ov7Cu91OKLPpyXObtZWdrHI2kxAvlWOkQR?=
 =?us-ascii?Q?ICXpl/WmNfX3tOARUZhPswlwHhO3k3HWNQsAgwQOOS2n/BXFag2WqGjG48S8?=
 =?us-ascii?Q?HBKgr8rtSsRYcAa6di22DhZ3HpB3FWGJfGOfKyTAwluisO8R9PL9aV4oMA9H?=
 =?us-ascii?Q?2d2emh5uUr1T7oXEr6fUY9aAMUxe5VGNmYaDRV+D5XZce2M0tpA6IWFmnd7+?=
 =?us-ascii?Q?GSzuJoR3dAKVEGmQNC5XWuvL/nWaJqSnCWN1pauIJxTOStGZF0moZ++YLxP2?=
 =?us-ascii?Q?t40Do7ts+ciEJfLhbw7w0sBuOaBhFx6DPS1aibACWY/Ocj9He3i3ADLAjG+J?=
 =?us-ascii?Q?7hreX/pydSLkJfL0ymbv+nWBRewExV6G4DrErKzhPf3BRBgiXbHFiJcB/KhL?=
 =?us-ascii?Q?fk55RQOZupvi11Fn4lgEwb8F0LoWA2QuReI8pn6jvkfcgXcBGrS9+oSM8nCI?=
 =?us-ascii?Q?2m+k8pS9HS8ra+Rr7YL+dYUj/lTjW6bHlMyjycbaolt7BVfbJOYRom1C2SxF?=
 =?us-ascii?Q?xRSylyfQH97onirvA8FwnXG53d0wWWSfj77nr9J4XOa9fzhjWPnGO+Ay2tOZ?=
 =?us-ascii?Q?qzp5Qi3BNOHYI8C3sUIuvKPI+9JPoCB4nmegSzY6uDFSTVMy9SmHRXtH4/h+?=
 =?us-ascii?Q?8grTLXFK9yxUCUNQEA5On28k6mjZEJ+89dbhQY/BW9XZMGPF4Ho+UjRpYXvo?=
 =?us-ascii?Q?8erpouItAu5LeqelPgJ37FJjNGZwH0+7GF3VNdKjraoT58Z6HtLU1x3PqnMM?=
 =?us-ascii?Q?mkMmX2a9L0qgGnKX26K2V+WDYyzZ0jwb+L47V6RNRcH38j4aa9NmE48t5ui/?=
 =?us-ascii?Q?G7k4HfSu1nqzm9PB2hrC36fX0sqTz3Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR21MB3025.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e66524-622c-4f9a-0806-08da1e90c283
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 03:33:51.3737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74YrQteKaxJViOpbNySodGZT1w2BRpK3ZcbMDx4/lxtU5/lrfAOzpu43Z1MB+mRQYSE5WYSkujvD7viYTZkcEzvpUS2p9v7yU0bYRaRoN6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR21MB3256
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
From: "Michael Kelley \(LINUX\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Andrea Parri (Microsoft) <parri.andrea@gmail.com> Sent: Wednesday, April 13, 2022 1:48 PM
> 
> So that isolated guests can communicate with the host via hv_sock
> channels.
> 
> Signed-off-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> ---
>  drivers/hv/channel_mgmt.c | 9 +++++++--
>  include/linux/hyperv.h    | 8 ++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
> index 67be81208a2d9..83d7ab90b7305 100644
> --- a/drivers/hv/channel_mgmt.c
> +++ b/drivers/hv/channel_mgmt.c
> @@ -976,17 +976,22 @@ find_primary_channel_by_offer(const struct
> vmbus_channel_offer_channel *offer)
>  	return channel;
>  }
> 
> -static bool vmbus_is_valid_device(const guid_t *guid)
> +static bool vmbus_is_valid_offer(const struct vmbus_channel_offer_channel *offer)
>  {
> +	const guid_t *guid = &offer->offer.if_type;
>  	u16 i;
> 
>  	if (!hv_is_isolation_supported())
>  		return true;
> 
> +	if (is_hvsock_offer(offer))
> +		return true;
> +
>  	for (i = 0; i < ARRAY_SIZE(vmbus_devs); i++) {
>  		if (guid_equal(guid, &vmbus_devs[i].guid))
>  			return vmbus_devs[i].allowed_in_isolated;
>  	}
> +

Spurious newline added?

>  	return false;
>  }
> 
> @@ -1004,7 +1009,7 @@ static void vmbus_onoffer(struct
> vmbus_channel_message_header *hdr)
> 
>  	trace_vmbus_onoffer(offer);
> 
> -	if (!vmbus_is_valid_device(&offer->offer.if_type)) {
> +	if (!vmbus_is_valid_offer(offer)) {
>  		pr_err_ratelimited("Invalid offer %d from the host supporting isolation\n",
>  				   offer->child_relid);
>  		atomic_dec(&vmbus_connection.offer_in_progress);
> diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> index 55478a6810b60..1112c5cf894e6 100644
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1044,10 +1044,14 @@ struct vmbus_channel {
>  u64 vmbus_next_request_id(struct vmbus_channel *channel, u64 rqst_addr);
>  u64 vmbus_request_addr(struct vmbus_channel *channel, u64 trans_id);
> 
> +static inline bool is_hvsock_offer(const struct vmbus_channel_offer_channel *o)
> +{
> +	return !!(o->offer.chn_flags & VMBUS_CHANNEL_TLNPI_PROVIDER_OFFER);
> +}
> +
>  static inline bool is_hvsock_channel(const struct vmbus_channel *c)
>  {
> -	return !!(c->offermsg.offer.chn_flags &
> -		  VMBUS_CHANNEL_TLNPI_PROVIDER_OFFER);
> +	return is_hvsock_offer(&c->offermsg);
>  }
> 
>  static inline bool is_sub_channel(const struct vmbus_channel *c)
> --
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
