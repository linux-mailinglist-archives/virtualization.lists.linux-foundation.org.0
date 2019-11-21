Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AC3105506
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 16:04:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C793E887D8;
	Thu, 21 Nov 2019 15:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id giMYg1A0nJhO; Thu, 21 Nov 2019 15:04:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21D2188844;
	Thu, 21 Nov 2019 15:04:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFC3EC18DA;
	Thu, 21 Nov 2019 15:04:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B55D9C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A549E87ED9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqmJb1VtKWZ2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:04:20 +0000 (UTC)
X-Greylist: delayed 00:14:49 by SQLgrey-1.7.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AC83F87EC2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWShRM1k2C1kZHsgV6rCE+jltq2xPeWhoaeDGZA7OWvn08lRUhZm5zImHXUkd7NehlLKmdPMdvl9TqwdXaLok6X8f4KL4G7BVWcMTqPJv/AnJ97BUsFWz16V8T7kOWe4qOor62X6dTzJrarKZpF2JD+VkGmSYV5xioVzq0qwg8r4dSw+8lOGMDCA1GSymoZgtkSBWTT8OV1HMWAmHZDB99wAgHKDRsODLqKklc68R+BM2RIuxXpvtQAzdMRIM+bKl8UtwBl9aa4Vo6LeF3yj2ShDZtzm7CfO/kke3ECbi/Zp9ukQMl9IO0Sv5g5msQUQrALvFLBgPf9WphZcjv5bOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFN7KBSvKZgjX34qFheOw/srsXvLKfykqCjZBIk1N3k=;
 b=TtK1X4ODneqSDJMXbUne/QAy0hmNp0haJ5fxZzXmfXs5ONqBKEuWjwtR05KHKEJcaScudj+xEpKJbOg/55EOvkqAx+bUZ5IlC9JOHudzKNmyKnfIdqg5Vv9maj31UNe+ZJW1ROYb1yiXun29Mpl1j8Lgi+PrmIQay9wpEC+z4FjuhmVgKAP+kpZRyFe7aQbIMYAM/+alVu4nj/bwEx5hIsgEFmOj+F2xdIM3xZYIWNn5nf5aHW+C1mMegWqOTlocBko+G+scp6vA2RjISIereLRhcqCosqloAxbf9bY/5bp7HJjZ9aLDBrZEEUnqEzHLZgwv04FDBKJBXzYEdNbamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFN7KBSvKZgjX34qFheOw/srsXvLKfykqCjZBIk1N3k=;
 b=FkTfRYTsT1spo8mXrsjCZvh//hbeIzFO/KRkpTvwcSauexwHw0kUhi9kIndSADFTBo8WoZBWdhFqSO7tV71J213oNINmt3WFG9vrHaodayY5aNy8XnnHcwPxpJtG+Y+AsOsRmB1ZKB9XHYdej55DYVzsDfMlJ7ezNHXzEvOZ4Z0=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
 MWHPR05MB3662.namprd05.prod.outlook.com (10.174.175.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.9; Thu, 21 Nov 2019 15:04:18 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209]) by MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2474.015; Thu, 21 Nov 2019
 15:04:18 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: RE: [PATCH net-next 3/6] vsock: add local transport support in the
 vsock core
Thread-Topic: [PATCH net-next 3/6] vsock: add local transport support in the
 vsock core
Thread-Index: AQHVnsi6A5C79S6UD0KKiVDL3k1B8qeVuhZQ
Date: Thu, 21 Nov 2019 15:04:18 +0000
Message-ID: <MWHPR05MB3376F4452F0CF38C1AFABA2EDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-4-sgarzare@redhat.com>
In-Reply-To: <20191119110121.14480-4-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4250684-73e1-4d29-5642-08d76e941512
x-ms-traffictypediagnostic: MWHPR05MB3662:
x-microsoft-antispam-prvs: <MWHPR05MB36626552084C8D193D0A21F9DA4E0@MWHPR05MB3662.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(199004)(189003)(66066001)(6506007)(71200400001)(71190400001)(8676002)(54906003)(9686003)(6436002)(110136005)(52536014)(229853002)(55016002)(76116006)(53546011)(66556008)(25786009)(66476007)(66946007)(66446008)(33656002)(102836004)(64756008)(316002)(446003)(11346002)(6116002)(4326008)(86362001)(74316002)(305945005)(7736002)(3846002)(14454004)(186003)(99286004)(76176011)(14444005)(256004)(7696005)(6246003)(8936002)(26005)(81166006)(2501003)(81156014)(5660300002)(2906002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB3662;
 H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRIdROe8BxytFZJZ2Uqmr4AyAeAO+S7WkQOkQwIUniUgH2qmfOmc1n3Ed9gqjCo1SkLfkCH8FHrH4C8y3VR4tO+BE+ewV4wJQs9+b310wwwkPlixL9BxOBFikO8IQ9Gw/cEMXYEPQMMXOdc567u5btV2YKidXO2J6f8Is33XcClKkQ3cgKP4qqblbbWhVhLfv8oYSVr81hEMJ+wds4h1W0gGRyocicIUNk0vV6vNTM1S9tuZqRfThzWtaN9M9xbPUFR7MK2XZjfMh6214wcVjaJD9zkf7wbqFvPO1dznMChR9uiuYyIHbqB9Fxp5Z3N+B/Rye4vW5A7mU77+KlhTSlm65KJ287blEx++WGkx10XvVGa3jwpxQ15/UzUkoBzdw2COYDw+KNljV2Z1IW52eph1YV4TzqxglGHaojgu2wvZ448rXzsYC4hqmpH89UBm
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4250684-73e1-4d29-5642-08d76e941512
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 15:04:18.3083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8OsOczFrILrMSM8N6dYe4CDU6czqh35qVycCJj3DFfYHVHIcyuQHVjXKq7kRFVY24RBoSOzbrkzaNE2CpnBBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3662
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>
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
From: Jorgen Hansen via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Jorgen Hansen <jhansen@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Tuesday, November 19, 2019 12:01 PM
> To: netdev@vger.kernel.org
>
> This patch allows to register a transport able to handle
> local communication (loopback).
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/net/af_vsock.h   |  2 ++
>  net/vmw_vsock/af_vsock.c | 17 ++++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index 4206dc6d813f..b1c717286993 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -98,6 +98,8 @@ struct vsock_transport_send_notify_data {
>  #define VSOCK_TRANSPORT_F_G2H		0x00000002
>  /* Transport provides DGRAM communication */
>  #define VSOCK_TRANSPORT_F_DGRAM		0x00000004
> +/* Transport provides local (loopback) communication */
> +#define VSOCK_TRANSPORT_F_LOCAL		0x00000008
> 
>  struct vsock_transport {
>  	struct module *module;
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index cc8659838bf2..c9e5bad59dc1 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -136,6 +136,8 @@ static const struct vsock_transport *transport_h2g;
>  static const struct vsock_transport *transport_g2h;
>  /* Transport used for DGRAM communication */
>  static const struct vsock_transport *transport_dgram;
> +/* Transport used for local communication */
> +static const struct vsock_transport *transport_local;
>  static DEFINE_MUTEX(vsock_register_mutex);
> 
>  /**** UTILS ****/
> @@ -2130,7 +2132,7 @@ EXPORT_SYMBOL_GPL(vsock_core_get_transport);
> 
>  int vsock_core_register(const struct vsock_transport *t, int features)
>  {
> -	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram;
> +	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram, *t_local;
>  	int err = mutex_lock_interruptible(&vsock_register_mutex);
> 
>  	if (err)
> @@ -2139,6 +2141,7 @@ int vsock_core_register(const struct
> vsock_transport *t, int features)
>  	t_h2g = transport_h2g;
>  	t_g2h = transport_g2h;
>  	t_dgram = transport_dgram;
> +	t_local = transport_local;
> 
>  	if (features & VSOCK_TRANSPORT_F_H2G) {
>  		if (t_h2g) {
> @@ -2164,9 +2167,18 @@ int vsock_core_register(const struct
> vsock_transport *t, int features)
>  		t_dgram = t;
>  	}
> 
> +	if (features & VSOCK_TRANSPORT_F_LOCAL) {
> +		if (t_local) {
> +			err = -EBUSY;
> +			goto err_busy;
> +		}
> +		t_local = t;
> +	}
> +
>  	transport_h2g = t_h2g;
>  	transport_g2h = t_g2h;
>  	transport_dgram = t_dgram;
> +	transport_local = t_local;
> 
>  err_busy:
>  	mutex_unlock(&vsock_register_mutex);
> @@ -2187,6 +2199,9 @@ void vsock_core_unregister(const struct
> vsock_transport *t)
>  	if (transport_dgram == t)
>  		transport_dgram = NULL;
> 
> +	if (transport_local == t)
> +		transport_local = NULL;
> +
>  	mutex_unlock(&vsock_register_mutex);
>  }
>  EXPORT_SYMBOL_GPL(vsock_core_unregister);
> --
> 2.21.0

Having loopback support as a separate transport fits nicely, but do we need to support
different variants of loopback? It could just be built in.

Thanks,
Jorgen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
