Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E0105724
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 17:35:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C543587EFB;
	Thu, 21 Nov 2019 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMBr+gXSjewE; Thu, 21 Nov 2019 16:35:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DCEA587EE6;
	Thu, 21 Nov 2019 16:35:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA8BDC18DA;
	Thu, 21 Nov 2019 16:35:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E2C9C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0B1A887EC2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RAysU9LtpsJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:35:24 +0000 (UTC)
X-Greylist: delayed 01:34:40 by SQLgrey-1.7.6
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C2BC287EB5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqY3UcW7dWiAWKrXduoXp9x/JZ0SaFQrakwrJQbgU2KqgNgAoD5gbfcVvVTs4UlIDavIcUDYOI5/qIFi7Y+OWbSImHB5QUtgHgN3NtfqsFnHtb9gKR4pVpwA+NRnQJl1fBghebqnjhIX56AZJ5mUie4SRkh8Hn9MI2RosYmOOqkISIQxVljH7rd4oJAT2t5MpfHZmoSwSec0uiH+yHX5xvQdWEZBHshHmfEjC2+LFnVAtkL1n3cdhDjWvXMIzy098WKVTQzJpVCSQ0eMSY38VqXGyAVc38I0UyUwqAO5UgwFmWQDlfHjUJGDZZOkVwPggpWO3NYdu+jcVdGxZLTR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMMeBq/9aomTlwObrpenS8dw0g+uYMvvmqOUnyCj2Rw=;
 b=frC6yKhoLpUlY8homFn9WDxt3AFedNK6KRtsQW+QMjXjyzo0Bpj1qXEc4HsA3wiW5W7X3X0G9MLTgFv3RqDe3AuN7cI0FVfxWohBv58an/uNYE6P3s9hGApAIQm4V4EFf1nVJ35IVahuDjUxHTuH8fOaet/mX9epTgD2LS4/Cl/KrPBLcxqwEFV4kVSB3wYLqhibMHiiRSJJtCqohLVQDDu8WQGcbwY6gvT8FAzRTqSUmMpCl4cYpeqljiQzgw+E6IQzkspcPcqCpryQk5L14Tgvgio3z0RlMD3DCsd8xMZyFPgRCtEWovvSJS30z/3BvyA7fJ+O8cJFs1NdBYA0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMMeBq/9aomTlwObrpenS8dw0g+uYMvvmqOUnyCj2Rw=;
 b=Fwh5P52pmi7hZm4F1NaUh6pgARKKNvFpcXNEXJbsIrzD9swm3+SPHByi+OoWHa7T+icq2sG7UccF87M6Bukfkc2cFaeBBQB549cJzhPCztS8+167QGIiDz+oHwDdDygc2YGHrwsDwSg7l2sGRQN93gZtAsKBjah4Ic6hhQXMqTo=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
 MWHPR05MB3677.namprd05.prod.outlook.com (10.174.175.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.13; Thu, 21 Nov 2019 16:19:46 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209]) by MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2474.015; Thu, 21 Nov 2019
 16:19:46 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>
Subject: RE: [PATCH net-next 3/6] vsock: add local transport support in the
 vsock core
Thread-Topic: [PATCH net-next 3/6] vsock: add local transport support in the
 vsock core
Thread-Index: AQHVnsi6A5C79S6UD0KKiVDL3k1B8qeVuhZQgAAHIACAAAGVwIAADKqAgAAA1wA=
Date: Thu, 21 Nov 2019 16:19:46 +0000
Message-ID: <MWHPR05MB33765BAE0807B11C507FF626DA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-4-sgarzare@redhat.com>
 <MWHPR05MB3376F4452F0CF38C1AFABA2EDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
 <20191121152148.slv26oesn25dpjb6@steredhat>
 <MWHPR05MB3376D95B5E50DF7CAF675EEDDA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
 <20191121161247.u6xvrso272q4ujag@steredhat>
In-Reply-To: <20191121161247.u6xvrso272q4ujag@steredhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c3599a-916f-4256-3f3d-08d76e9ea033
x-ms-traffictypediagnostic: MWHPR05MB3677:
x-microsoft-antispam-prvs: <MWHPR05MB3677C2D988B3D0C1FF801400DA4E0@MWHPR05MB3677.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(189003)(199004)(2906002)(66476007)(66946007)(7696005)(76176011)(4326008)(33656002)(66446008)(66556008)(64756008)(76116006)(5660300002)(52536014)(71190400001)(71200400001)(8936002)(99286004)(6916009)(74316002)(9686003)(55016002)(478600001)(7736002)(6246003)(8676002)(81156014)(81166006)(229853002)(6436002)(305945005)(3846002)(6116002)(316002)(14454004)(11346002)(446003)(256004)(14444005)(66066001)(86362001)(102836004)(26005)(54906003)(6506007)(53546011)(186003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB3677;
 H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5hj/4Vnd8z7ohkqZBlDzjUhVarbLKNUFln3WcM3gbpQRybRJP2Zflqqlg+bhOKfeNv/MSMHRcJjPSZCg+CJVPjqgyEavAXG3k8pbCoSesFD62/+6sYeJeaIvERn2WIRoJtmArHsLPKzHJLJ5aNf1Fx2STM3r2hx6ewwsofuzir+pt23IbjoMOzHBg6J5dgpBT5/IT18Nuxjehx0sU9AS70k+g3uVanURowwYCSIYNAn1mE2N44mmXWKPbUHKHkRuQ0N6SMguI3M2Qi/Tcw6GNLdRxcPGs2A9NnCJkcb37mHXv8mawSEK+jAhQ2Z5aclHODvX0aRp0qpI1d9XP+jREFm4kTNrKal+Vj5YUV+JkZ/xzZPEwooufVH2SeWBI8lQKyAk1jKRBg+BiLSmuj2+B/ncgHX7D9aEIh/vEb2dazPYSoVtAwhe1KQTjz/jZPGF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c3599a-916f-4256-3f3d-08d76e9ea033
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 16:19:46.6726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CDAl1ocMcevzE7ExJQBfnOklGjlc51jn2nk16Fb7hsT05ACP0LTQaIor+YpqXr5F05otBXkN5Y8IruDJkx2cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3677
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
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
> Sent: Thursday, November 21, 2019 5:13 PM
> 
> On Thu, Nov 21, 2019 at 03:53:47PM +0000, Jorgen Hansen wrote:
> > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > Sent: Thursday, November 21, 2019 4:22 PM
> > >
> > > On Thu, Nov 21, 2019 at 03:04:18PM +0000, Jorgen Hansen wrote:
> > > > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > > > Sent: Tuesday, November 19, 2019 12:01 PM
> > > > > To: netdev@vger.kernel.org
> > > > >
> > > > > This patch allows to register a transport able to handle
> > > > > local communication (loopback).
> > > > >
> > > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > > ---
> > > > >  include/net/af_vsock.h   |  2 ++
> > > > >  net/vmw_vsock/af_vsock.c | 17 ++++++++++++++++-
> > > > >  2 files changed, 18 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> > > > > index 4206dc6d813f..b1c717286993 100644
> > > > > --- a/include/net/af_vsock.h
> > > > > +++ b/include/net/af_vsock.h
> > > > > @@ -98,6 +98,8 @@ struct vsock_transport_send_notify_data {
> > > > >  #define VSOCK_TRANSPORT_F_G2H		0x00000002
> > > > >  /* Transport provides DGRAM communication */
> > > > >  #define VSOCK_TRANSPORT_F_DGRAM		0x00000004
> > > > > +/* Transport provides local (loopback) communication */
> > > > > +#define VSOCK_TRANSPORT_F_LOCAL		0x00000008
> > > > >
> > > > >  struct vsock_transport {
> > > > >  	struct module *module;
> > > > > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > > > > index cc8659838bf2..c9e5bad59dc1 100644
> > > > > --- a/net/vmw_vsock/af_vsock.c
> > > > > +++ b/net/vmw_vsock/af_vsock.c
> > > > > @@ -136,6 +136,8 @@ static const struct vsock_transport
> > > *transport_h2g;
> > > > >  static const struct vsock_transport *transport_g2h;
> > > > >  /* Transport used for DGRAM communication */
> > > > >  static const struct vsock_transport *transport_dgram;
> > > > > +/* Transport used for local communication */
> > > > > +static const struct vsock_transport *transport_local;
> > > > >  static DEFINE_MUTEX(vsock_register_mutex);
> > > > >
> > > > >  /**** UTILS ****/
> > > > > @@ -2130,7 +2132,7 @@
> > > EXPORT_SYMBOL_GPL(vsock_core_get_transport);
> > > > >
> > > > >  int vsock_core_register(const struct vsock_transport *t, int features)
> > > > >  {
> > > > > -	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram;
> > > > > +	const struct vsock_transport *t_h2g, *t_g2h, *t_dgram,
> *t_local;
> > > > >  	int err = mutex_lock_interruptible(&vsock_register_mutex);
> > > > >
> > > > >  	if (err)
> > > > > @@ -2139,6 +2141,7 @@ int vsock_core_register(const struct
> > > > > vsock_transport *t, int features)
> > > > >  	t_h2g = transport_h2g;
> > > > >  	t_g2h = transport_g2h;
> > > > >  	t_dgram = transport_dgram;
> > > > > +	t_local = transport_local;
> > > > >
> > > > >  	if (features & VSOCK_TRANSPORT_F_H2G) {
> > > > >  		if (t_h2g) {
> > > > > @@ -2164,9 +2167,18 @@ int vsock_core_register(const struct
> > > > > vsock_transport *t, int features)
> > > > >  		t_dgram = t;
> > > > >  	}
> > > > >
> > > > > +	if (features & VSOCK_TRANSPORT_F_LOCAL) {
> > > > > +		if (t_local) {
> > > > > +			err = -EBUSY;
> > > > > +			goto err_busy;
> > > > > +		}
> > > > > +		t_local = t;
> > > > > +	}
> > > > > +
> > > > >  	transport_h2g = t_h2g;
> > > > >  	transport_g2h = t_g2h;
> > > > >  	transport_dgram = t_dgram;
> > > > > +	transport_local = t_local;
> > > > >
> > > > >  err_busy:
> > > > >  	mutex_unlock(&vsock_register_mutex);
> > > > > @@ -2187,6 +2199,9 @@ void vsock_core_unregister(const struct
> > > > > vsock_transport *t)
> > > > >  	if (transport_dgram == t)
> > > > >  		transport_dgram = NULL;
> > > > >
> > > > > +	if (transport_local == t)
> > > > > +		transport_local = NULL;
> > > > > +
> > > > >  	mutex_unlock(&vsock_register_mutex);
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(vsock_core_unregister);
> > > > > --
> > > > > 2.21.0
> > > >
> > > > Having loopback support as a separate transport fits nicely, but do we
> need
> > > to support
> > > > different variants of loopback? It could just be built in.
> > >
> > > I agree with you, indeed initially I developed it as built in, but
> > > DEPMOD found a cyclic dependency because vsock_transport use
> > > virtio_transport_common that use vsock, so if I include vsock_transport
> > > in the vsock module, DEPMOD is not happy.
> > >
> > > I don't know how to break this cyclic dependency, do you have any ideas?
> >
> > One way to view this would be that the loopback transport and the support
> > it uses from virtio_transport_common are independent of virtio as such,
> > and could be part of  the af_vsock module if loopback is configured. So
> > in a way, the virtio g2h and h2g transports would be extensions of the
> > built in loopback transport. But that brings in quite a bit of code so
> > it could be better to just keep it as is.
> 
> Great idea!
> 
> Stefan already suggested (as a long-term goal) to rename the generic
> functionality in virtio_transport_common.c
> 
> Maybe I can do both in another series later on, since it requires enough
> changes.

Sounds good to me.

Thanks,
Jorgen

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
