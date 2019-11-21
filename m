Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD410554C
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 16:21:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E76EE87F85;
	Thu, 21 Nov 2019 15:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9kQMvuU7JA4; Thu, 21 Nov 2019 15:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5562087F07;
	Thu, 21 Nov 2019 15:21:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D61AC18DA;
	Thu, 21 Nov 2019 15:21:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 978F3C18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7E41B87F07
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sRaX2M8hVZQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:51 +0000 (UTC)
X-Greylist: delayed 00:36:17 by SQLgrey-1.7.6
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730087.outbound.protection.outlook.com [40.107.73.87])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 650ED877C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBkI4vunlT1Qd5Yr9bgqgMd2IpVPHq/4qF7UqQN1qVRJ64YByizjtX/ebHIPkJzEg1Ezkd5nWO3m0yi0/BEpiedBZmTG6fAmvpulQH6Adk2rgyazx5FRVXiotQSgTDK5xrsWmlIQX7sobZPyxlF6m5wT6CmquMToSIzESX3c7ba8rEpQnnX8+987ItgeNNXA8ZMGIhO4ePMrs8fdv2A3lpgMhyPuW577hNhswBqgFP5AynpQQkhBb1WDceU5p7Dy2Z2YYaFt/QHGBrYwqWh8qp7oxRTK8Pr/7jzY1IozG7/1kad8Pf62sKTzbmjqBUvuO/nqXapblwVATe2rFSlBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9vS1KIYVvEOfpH2Fg5Ht25laCoL7MvW+J/8IT+g1zI=;
 b=LeMMER0BQcNqbuX9FnjfY/cmW1RxUMjxT7FBOEEXKQ1qCremPJnm5jMn6CpWv9JJkGpjH+SKK6qvvg/8nyCpM3qiDO+50utCBesxju3QoSrSeRt59e/7h0+Gnuh24en9kZrQFQYtMPkn9267wsjQSnXtFYQdCJ89DRg8EvIvbC+2as80x9iB+Y+JM6F6tLePxUu3KaLFIiQPAaGDJTI3RCTIn8M+qObY8xqFslhUhvqXVskjH/Ds/B1Q4wWGQfiyEHLjYf9K1wTTqdp/sEeOGZD2eF927VGLFoZBb4fFf43GokxTJZTdVsynDB9V0K2YEA4+aYRqm805x7YTHZnKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9vS1KIYVvEOfpH2Fg5Ht25laCoL7MvW+J/8IT+g1zI=;
 b=Usv5MI1Ngg2ZVerUC632g1e2H5QAtlVUks8OA8DcgHS+QygeovJQwUNqIhXFTefXc7eQqmaLjxDn+FQfgJ9D/y7I3gnKojQbZFcNhXmy2oxEP4yYPaWs0kqecGYFNAj0Ls+xH7hFsD+4hlhIFi48fVAeqRxzc7hTHd/va6Vbdmk=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
 MWHPR05MB2990.namprd05.prod.outlook.com (10.168.246.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.12; Thu, 21 Nov 2019 14:49:25 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209]) by MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2474.015; Thu, 21 Nov 2019
 14:49:25 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: RE: [PATCH net-next 2/6] vsock: add VMADDR_CID_LOCAL definition
Thread-Topic: [PATCH net-next 2/6] vsock: add VMADDR_CID_LOCAL definition
Thread-Index: AQHVnsi5Wq8LW+X9eEusiPvX4m8fNqeVt8Jw
Date: Thu, 21 Nov 2019 14:49:25 +0000
Message-ID: <MWHPR05MB33764A74EC512852DF16C6C9DA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-3-sgarzare@redhat.com>
In-Reply-To: <20191119110121.14480-3-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f7775d0-d2e5-4973-12e3-08d76e92011e
x-ms-traffictypediagnostic: MWHPR05MB2990:
x-microsoft-antispam-prvs: <MWHPR05MB29908DA2B671604018191DA3DA4E0@MWHPR05MB2990.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(189003)(199004)(305945005)(99286004)(14454004)(81166006)(81156014)(8676002)(8936002)(71200400001)(71190400001)(7736002)(86362001)(74316002)(6436002)(33656002)(4326008)(478600001)(66476007)(66556008)(64756008)(52536014)(76116006)(66946007)(110136005)(54906003)(11346002)(446003)(25786009)(5660300002)(66446008)(7696005)(6506007)(102836004)(9686003)(76176011)(55016002)(186003)(26005)(316002)(229853002)(66066001)(6246003)(256004)(2906002)(2501003)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB2990;
 H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1ZRHmRk62P4wHssWTA3SE6TE8iBQ2wrZ5xsxzfHxyx5ZKYe4wI5+fCSnFasnSH/b7dItCtgruyYEqVwNm2Rpk924nUR4bh0eKHWdCH7es6kthmMJ3PUCVHsXO3odvY6hHHzub3IomMra0j1mY+jtR2quZxvDgD8/GQuBtl1M+TPKjug9IVuaIvADdFDADzE1lisasXZE6ZoWAiHwJ7qyjtTpsSPcE+xHxguo9toqb02gKJfd+ggqajoVlV7yEdTBRZL0aLC8IRkiUWxnCru2Lm3brog/np266eJ6C9GilHQiwtUvmBgEi6sKYkR+dWoQVqHC8Is2jTDZ5oYJm4sXBmjqSfiXFideWx+Z2cwnHLIoy6aXHxgM/4wMpGTjD4hpQ/vs+eiOry9DgKyHblVtZkHZ56Q4euUmOBYyQbyC4c7me40JTJzn1R03jUnODen
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7775d0-d2e5-4973-12e3-08d76e92011e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 14:49:25.7374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MjEIS0NKvSM3ypAzaNdgbgn9vAxvKEc7ABk+OPElAHMwxqEd/94RkKc/mjgaBEd1ei9M81lxkcCAXU/hN0Mhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB2990
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
> 
> The VMADDR_CID_RESERVED (1) was used by VMCI, but now it is not
> used anymore, so we can reuse it for local communication
> (loopback) adding the new well-know CID: VMADDR_CID_LOCAL.
> 
> Cc: Jorgen Hansen <jhansen@vmware.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/uapi/linux/vm_sockets.h | 8 +++++---
>  net/vmw_vsock/vmci_transport.c  | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/vm_sockets.h
> b/include/uapi/linux/vm_sockets.h
> index 68d57c5e99bc..fd0ed7221645 100644
> --- a/include/uapi/linux/vm_sockets.h
> +++ b/include/uapi/linux/vm_sockets.h
> @@ -99,11 +99,13 @@
> 
>  #define VMADDR_CID_HYPERVISOR 0
> 
> -/* This CID is specific to VMCI and can be considered reserved (even VMCI
> - * doesn't use it anymore, it's a legacy value from an older release).
> +/* Use this as the destination CID in an address when referring to the
> + * local communication (loopback).
> + * (This was VMADDR_CID_RESERVED, but even VMCI doesn't use it
> anymore,
> + * it was a legacy value from an older release).
>   */
> 
> -#define VMADDR_CID_RESERVED 1
> +#define VMADDR_CID_LOCAL 1
> 
>  /* Use this as the destination CID in an address when referring to the host
>   * (any process other than the hypervisor).  VMCI relies on it being 2, but
> diff --git a/net/vmw_vsock/vmci_transport.c
> b/net/vmw_vsock/vmci_transport.c
> index 644d32e43d23..4b8b1150a738 100644
> --- a/net/vmw_vsock/vmci_transport.c
> +++ b/net/vmw_vsock/vmci_transport.c
> @@ -648,7 +648,7 @@ static int vmci_transport_recv_dgram_cb(void *data,
> struct vmci_datagram *dg)
>  static bool vmci_transport_stream_allow(u32 cid, u32 port)
>  {
>  	static const u32 non_socket_contexts[] = {
> -		VMADDR_CID_RESERVED,
> +		VMADDR_CID_LOCAL,
>  	};
>  	int i;
> 
> --
> 2.21.0

Reviewed-by: Jorgen Hansen <jhansen@vmware.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
