Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6BBE9E90
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 16:12:54 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8682EA8;
	Wed, 30 Oct 2019 15:12:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86B48E98
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:12:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D4C3842D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=noJqO3Ip19r5rgcAhw8tx0pddliG72rBcWRWNu0mc1WU4ArhzpHBaPVu7u0JruFM4nhfEVBb9YrhHaDtY0tXZv8JTHgPpR62h4EROMz42W6488d8rceNsWttGCiWjCoBZRcjY5FiyyUl8v9epIBYlRMVfEC8o+kHUeVfQL61kidJMwVWkfM1fpcPpQTQr8tlfgOb3XIcfBGwzxJ09/KOw0NJAFH8uuCMcm459JoQcq6y20HILxRB/p5WeeJ4XhjImiHCAICq3kX6lLv4iJ04DXQdKQ/tx5zmPr4H65twoa8ILcaLKGwDvvOCWzAQfNzuKqT1h9ZKOMD4rzgKKKyBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NzzHu8DgtX4p9A2M02oBbu7Z+TJsVVVCsi5Iz/qW7NA=;
	b=H46dEFNUvr0+sWIMvh03xHN8WioBssPYyQtIh4p5teQiWpbml8O9Gii6lEfce6NTLAqvp54cPZ6TqgU97Z8himM+02OY3FdJDeWJPXGVvOoUEHta9hEj/d9v3u/97piPXKC5oQxsVkaFuVeKHFVWvXOkmq4R2l4WSuq3f3/T0T5xOwR/xzBXP6ajT35da3YbIl0gA2dnIWR0TZ73wIGHu+vQQoUwX8nfOw/XzUjyJTnjft+rm31OjTbJiGRUN7i4fJIqniZvqmbu1v8nFJF++t3PcvnVToTErYdonSZgbOePOZoaXDGklOshyjAHCZnPKqmQZT/IBInsDb2F+TJbjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NzzHu8DgtX4p9A2M02oBbu7Z+TJsVVVCsi5Iz/qW7NA=;
	b=Lfbw9KfCl8brr/UTr5cnhiuiq9GuCHUpO5sim2IUCg9Lj4c+v5pcJcWBSF5iB1BQ+5Z0mZERHQUgjfsMigmDiU3hcfoTHvuyxfLDPiyq8iuOzvgYEuwlzHfFH4ezYfCauKfMVrouMpI0Bsob5DrnHC3P061OpZML35B7xHDSTqA=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
	MWHPR05MB3166.namprd05.prod.outlook.com (10.173.230.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.15; Wed, 30 Oct 2019 15:12:44 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209]) by
	MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2408.018;
	Wed, 30 Oct 2019 15:12:44 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>
Subject: RE: [PATCH net-next 09/14] vsock: move vsock_insert_unbound() in the
	vsock_create()
Thread-Topic: [PATCH net-next 09/14] vsock: move vsock_insert_unbound() in the
	vsock_create()
Thread-Index: AQHViYhfJel1oSdLBEeiIeROnyOLN6dzVcKg
Date: Wed, 30 Oct 2019 15:12:44 +0000
Message-ID: <MWHPR05MB3376135849CB059332CEEFB5DA600@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-10-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-10-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [146.247.47.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48d9276b-0644-4d4d-c02e-08d75d4b9d70
x-ms-traffictypediagnostic: MWHPR05MB3166:
x-microsoft-antispam-prvs: <MWHPR05MB3166290D1868DBCFCC454ED7DA600@MWHPR05MB3166.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(189003)(199004)(229853002)(2906002)(71190400001)(8676002)(33656002)(8936002)(81156014)(99286004)(3846002)(6116002)(71200400001)(81166006)(66066001)(25786009)(256004)(14444005)(4744005)(6246003)(6916009)(6436002)(316002)(55016002)(9686003)(4326008)(66446008)(66556008)(74316002)(478600001)(486006)(7696005)(305945005)(64756008)(53546011)(76116006)(86362001)(66476007)(446003)(11346002)(54906003)(186003)(26005)(6506007)(5660300002)(14454004)(476003)(76176011)(7416002)(66946007)(102836004)(52536014)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB3166;
	H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LciM39UyVQVXMQUZK29HnLfzylvs02mFKoE5dSUDh8Nm3yYrForTpjc4wIPoq99HTAsUKeUFnKUliG+8lSues/mwsObIRfM6+eCb9ksWGWn8LOFF9XWtjaug6Ds47Vzu0PRW3J3n/IofFKKGgop910vqew4VtJM2gHCGr8GeKM8g9tKxjdaLJZ057198GNIKv0YrkNzenuqPytb6DWDPNQrgRF04q1FspKqp+4Hi8R9QqfEx9D7woT3mZWMhkChJei5ojG+l0U4xiOHAJyo50fCQAGfAjxSCHz3e8bLJ23EH0Dx54+HDXLmqewzXq16iq/6eiDuoKWNnLmjyhhatZyDPCktZ36gXXfzEEhX0BMRg/idDg0tRFtL0evUTkQHgDTDQgHcAkLq5K00U/TBPNooq8pLBUb0w4OD3UKmoaCxAvr8sOYTMiWO4kGAPJ3Ob
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d9276b-0644-4d4d-c02e-08d75d4b9d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 15:12:44.0347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6lKujJ+P8lloNtVzvun1PWVqWzZPhmPsaDU9D33Mw2bsPd4v6wGDl4+9bjsK6UHYfdpsx5UfCO/cTJw8d/pYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3166
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dexuan Cui <decui@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Wednesday, October 23, 2019 11:56 AM
> Subject: [PATCH net-next 09/14] vsock: move vsock_insert_unbound() in the
> vsock_create()
> 
> vsock_insert_unbound() was called only when 'sock' parameter of
> __vsock_create() was not null. This only happened when
> __vsock_create() was called by vsock_create().
> 
> In order to simplify the multi-transports support, this patch moves
> vsock_insert_unbound() at the end of vsock_create().
> 
> Reviewed-by: Dexuan Cui <decui@microsoft.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/af_vsock.c | 13 +++++++++----

Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
