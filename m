Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA3E9E84
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 16:12:14 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 675EEEA1;
	Wed, 30 Oct 2019 15:12:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E5A6E52
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:12:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 89FC963D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=I+AYMQuZMIYasmmfFzr+pRe76Fe+ZKA8TkVMRve9zRMW7OaO/hk8k3H4qMO/z2/qpxbnkye8RNCpxykC9NzAAxry0giOjd6c8u9XO0aUIkEHy9QjmaYyKHsKWryta8+S9pxvIgXMIyu/UZKUNxxq2Hhlfs+baOcdvM3G9jHA+Xvjzr8JGn+26wrv4vzNRpcxupmvFV0QaI1Vy0dF1KS2aMkvuBXZTSiJlK0EQzcH6c3NQpHVk/7ZT+ypniQ9BMYyH+4b8pAkE7+aSuzCkFxV17X2kFhRUBzRG/XoHLaf2kIpYAwCwTlDKYeVkei2lMLNVSvTaGG1TiDHVx88PKOn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D7M2rzwapq2j4EcLgblt7FMr7H0APJlJVoHuYLp4ohc=;
	b=fRfNzhzUj9+XECgxY90ffDbUYtADo3AJG8iZOGZeXUUCvkGrxOJoas7Lj1m5ensYSK3eSgcuAHrcwekUIziJaYWEbVfZoxACTwgbXpOOukeQpSO37R5nLA+1m4NCCENzzWaatwSFMvfXEvoQreRJMqplvYg/EEdmRmfzTOl6v53atA2qmzkvcFN6H99kmpeTKBqUy2MjdfeOC1hjjJUUBuZxNPSNs0jJ+9nUQJXJUmICtU+H/Y1yx9r+vJQ7hiOoWXF3XRWqsOhfxXbhcRKTV7N+ioAoP/e8cFYyx55T2cX4T1ccBZ6DPo3gdoaAywml9fp0kaD429PGEl+NBIaS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=D7M2rzwapq2j4EcLgblt7FMr7H0APJlJVoHuYLp4ohc=;
	b=l6DVykWHcmQPbG7q8CGTfWOOeosyMifUWKXEa/CPCpDuE2Ftw15elq8VFGEMyIdRjnqhRS5z35MLX/cjwQatVbrVUA4JRdlpAOmzrtFxa7UAb44l9hxbiPKe1QocWFIIB8vPlkx+EiI8g7l6nBkMyM9K4QwuuHljgr4kb6485Kg=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
	MWHPR05MB3232.namprd05.prod.outlook.com (10.173.230.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.15; Wed, 30 Oct 2019 15:12:03 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209]) by
	MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2408.018;
	Wed, 30 Oct 2019 15:12:03 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>
Subject: RE: [PATCH net-next 08/14] vsock: add vsock_create_connected() called
	by transports
Thread-Topic: [PATCH net-next 08/14] vsock: add vsock_create_connected()
	called by transports
Thread-Index: AQHViYhdeVPi6OQfNk2qMDuo8gjV+KdzVVZA
Date: Wed, 30 Oct 2019 15:12:03 +0000
Message-ID: <MWHPR05MB337613E733661BE7D00DDC2ADA600@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-9-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-9-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [146.247.47.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5f6391d-1e42-414e-0b2c-08d75d4b854e
x-ms-traffictypediagnostic: MWHPR05MB3232:
x-microsoft-antispam-prvs: <MWHPR05MB3232159B19AC71FB2B804564DA600@MWHPR05MB3232.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(189003)(199004)(316002)(6116002)(2906002)(3846002)(66066001)(6436002)(14454004)(25786009)(229853002)(54906003)(9686003)(8936002)(55016002)(6246003)(81166006)(81156014)(8676002)(478600001)(5660300002)(33656002)(4326008)(52536014)(7696005)(7416002)(76176011)(74316002)(6916009)(6506007)(53546011)(446003)(476003)(256004)(11346002)(14444005)(66476007)(7736002)(99286004)(71190400001)(26005)(186003)(4744005)(102836004)(76116006)(66556008)(66446008)(86362001)(486006)(305945005)(71200400001)(64756008)(66946007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB3232;
	H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U8jcSxRgeoqUiGgF2bcev2uKOsQOkEi/V92VL4Amd6wN6P0ikB6BgEHOh+Uh+VGUpHLnF+Ij7ECnkK6GzjAF/6jD24QNMuoTeRF5B3oJzv9yvUF/JTJRBPTgFkKWUlsAt+Y6EwNzsnDvm2ya7PoOgqOmq2cAMhst26CEer6hTAiSlSZ7E7IYnZm3fGZtX99NNMajUA89g23+xiQY4eafa2hsqB7mFPbCvvsSx3psRMZhG5IO4xtoBUMQQodKmPgx/g0ZN7EfVzKgTudSUM3VqCFe1J3XpsSlTL+7d/tK31ldJDQBuHndxAL4Fi5C012P2sttXzkng1Tg0qfw+VKgO8jjj8xaUwEVoLBllmP8VkGFrs9zOT2F7e4L8XAwp5RwzYZgILRtoXLxb0RN/YLbR9USidR78irPzD4YC45LRticZ7wWSUqj/YBeTu2W26VF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f6391d-1e42-414e-0b2c-08d75d4b854e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 15:12:03.6239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fxRfUsxZxP3H23+eW9H01NdAsBo9jb7mc7TjfB7JHX2qyiBS2Y2lutbqBth0DiHK0HWA/R1XzsNgyjFMqD8Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3232
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
> Subject: [PATCH net-next 08/14] vsock: add vsock_create_connected() called
> by transports
> 
> All transports call __vsock_create() with the same parameters,
> most of them depending on the parent socket. In order to simplify
> the VSOCK core APIs exposed to the transports, this patch adds
> the vsock_create_connected() callable from transports to create
> a new socket when a connection request is received.
> We also unexported the __vsock_create().
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/net/af_vsock.h                  |  5 +----
>  net/vmw_vsock/af_vsock.c                | 20 +++++++++++++-------
>  net/vmw_vsock/hyperv_transport.c        |  3 +--
>  net/vmw_vsock/virtio_transport_common.c |  3 +--
>  net/vmw_vsock/vmci_transport.c          |  3 +--
>  5 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
