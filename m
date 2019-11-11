Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C6F7937
	for <lists.virtualization@lfdr.de>; Mon, 11 Nov 2019 17:54:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F196DC3;
	Mon, 11 Nov 2019 16:54:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 65FC9D81
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 16:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DD20B5E4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 16:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZMHaihd5swPTo8NM4iJvoDHaYFhG22GbuwU1rxP6flebx/5NwfxDpeaDgD5Hm4M1UcXnSnSfFO5YFOv+TFpTu4XPi7gJYvxVT1NfRrprYyfIb29R/iqI56nYktyRupt6yS/J3JQ80fUB9nH7UIs5347/Xk8hr7y3GN0Liqwae1qfFkh4cIPKGyHgzwO+iJrnJo8CqMFffdcptmjNDDnxXGPVDc3QibgdE5cnpRwRz+PMAsELAmlHydH9g/e/yDihFWWfgrUdcTC11EJWgu3R8gBSeKEa1Bv8+UJveCyq7f9bXS5seM7DyhCgKhC9jXcD445YbGvYfPcwLvI5xVq98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eXxpGMwcY8AIlKUPc+HRRXrp/xU6aEhztN1pZ4ZGk0Q=;
	b=Bxdun3Kwt1L5N3vQVzqbOKB29EQPnOsA8bNYH5D4UTcx+BaVkc6PvT3KeYyKfWrX64SOFkSeQ4bHlZJuFxUxTBuzbZHaK73ZWWA3FohPJsQ6wtp9mT94RXMiN6zIAYrbHqhTRnWBauvj5/tX4Jy/9+nbvUdjBUCYLRzWiVoE636DbF1FcRomuPJB72CTN8dHh1bwJ+hHVMFXcKIlGeHfJiD+AeirmPlRqgRcXZxHHZUWMvnPoBJ8G9ktWdd0XSVc+wQp3os0S+yDK/XPhwRziaRH+mVFMSn71P1UK0poqYJTK6i4LJbXivWHpI4A2XjY+GLeDuE42JyaHCEYdSGDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eXxpGMwcY8AIlKUPc+HRRXrp/xU6aEhztN1pZ4ZGk0Q=;
	b=o6/7BoHPgqhPv4cR/CGNcZ+Ti32aUES47NMPTTtIxXrMmm20Y9r3Qtl/gwuutReG/SbY5kGSrQU4liIHl8FIEO7pgVuzG3PoYFS/eBtElBSSv/aFX3AzhT27UfZpxwXi43LdElDh7zl0WxW3ZceRzJ/udT2pVFf3dUWnioJst4I=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
	MWHPR05MB3214.namprd05.prod.outlook.com (10.173.230.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.16; Mon, 11 Nov 2019 16:53:56 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209]) by
	MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2451.018;
	Mon, 11 Nov 2019 16:53:56 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH net-next 14/14] vsock: fix bind() behaviour taking care of
	CID
Thread-Topic: [PATCH net-next 14/14] vsock: fix bind() behaviour taking care
	of CID
Thread-Index: AQHViYhvgtICjaQ2wUamZLOokx2SmaeGTQhw
Date: Mon, 11 Nov 2019 16:53:56 +0000
Message-ID: <MWHPR05MB3376C7CE32B8FD98DE4EF45FDA740@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-15-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-15-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 586862f1-092d-41fc-a29a-08d766c7bdb8
x-ms-traffictypediagnostic: MWHPR05MB3214:
x-microsoft-antispam-prvs: <MWHPR05MB32147DCDB81F19C830A822CDDA740@MWHPR05MB3214.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(8676002)(9686003)(256004)(8936002)(4326008)(14444005)(446003)(81156014)(81166006)(2906002)(11346002)(26005)(2501003)(186003)(6246003)(55016002)(476003)(486006)(66946007)(6116002)(3846002)(6436002)(74316002)(66066001)(305945005)(76116006)(54906003)(76176011)(33656002)(478600001)(66446008)(64756008)(66556008)(66476007)(102836004)(110136005)(99286004)(4744005)(86362001)(71200400001)(316002)(71190400001)(7696005)(7736002)(229853002)(5660300002)(52536014)(7416002)(14454004)(6506007)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB3214;
	H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0gonDZt8gbrfqqulTmmSYlQceZvrHcvVDoCXJfczH8BhRpKryXFvP0EVRB2lurxjZy4f7vPPmezXL28N+HdM8ICLQVfAUVgIo8/4YttqfxtdgfscHLe5w22bgqsxPaxyOhRhr4SjLj99NjT7fQP4flR02D3iVoHGW5XLja7DlX+5a0L0I0Opx9oJFtesTRNua/vrdHSgDlG+Db12+NAjKKJRkWwLPCb30U9vyUgwXQq32nIGjwqglm1XQtEqTo7sj08ltDIKTF9+SJKekwEIKh4zWzkHGsFh3UqJCScHFxWErE49cHCDAjVdr1JgwSwPMIcx2+9GuiQA56c8dGR1pjDJQD7YiROetxGEBte85uXKWX3SjR9IIE8l9DMeTRkR0NGKFGckHbuuswWclNmhwBsAcQLmAh1tjCo5IzJHn1XsmYejpJM/Avd2neEBWeHp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586862f1-092d-41fc-a29a-08d766c7bdb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 16:53:56.1814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +iiRXE6SDCUoPODDvrOpHq2NEj7NcnaL7jbnL7rWeDois7ccpL+lgCg+qMCEKwd1M2Anqxq5UCUWc6RKIjNBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3214
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
> When we are looking for a socket bound to a specific address,
> we also have to take into account the CID.
> 
> This patch is useful with multi-transports support because it
> allows the binding of the same port with different CID, and
> it prevents a connection to a wrong socket bound to the same
> port, but with different CID.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/af_vsock.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Jorgen Hansen <jhansen@vmware.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
