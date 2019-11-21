Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B62810552D
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 16:19:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E95E486FEC;
	Thu, 21 Nov 2019 15:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1wSRJnsf59L; Thu, 21 Nov 2019 15:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D62CD86FC3;
	Thu, 21 Nov 2019 15:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8947C18DA;
	Thu, 21 Nov 2019 15:19:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C259DC18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B18BA87729
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJim9qI9F23v
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:19:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A1ACC87700
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 15:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7jGzBDywQYgTsWBNRktbjob0AQxPYiROVeQbVo/qT095lXVpc9LdBqG/TYTsIv/7YNblqvnuHnwqZpchKqI89/uL809Ep2c5iVOm3IIQSv7uz/in/0YEDe6PjlQX4iUgDmjqP1nPOpTD/h04hufHfNosXQLRcFF/51nc8ylWYtLZsq1kcA+gxS2SNmsX6H3cUw0QHiDch80bYttoAayyl6vR/sTv3x4ojJcbXg8/xCeJ0TjNHq0XgivAFT47KowPRhq5poUd0pjUF0QWVrZTYxWPoFKm2CUmWF8esqxT8DZILgdtKOCAdKZXZG9VAnYMNR3pjnlDuVvfhWoJMvRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHZQ7mFRNDH24ZO/Apdnkglm+mP0xhv+1pZFgZu0yQU=;
 b=MTNv27Nk3uyghaoB2gGcLhEzjMNGcS+xZPEMLLa7nyjsZPi5OK7GyRKxQzZFJ6OkYnBoC1m4YqO0e0eQj6ru319ItRiIwxSs5OhVF78cxnm0ql+9ldgWfen3iWV8rJdu4TdQ3HopAr7gVHBgZMKvE434HCRwA78wOn6Reer5EQgi/PmeEyg1wZR6r2MZMpKdUcdTvyGJEp707/bYr9ZugyIZ3gedfRna9eU8u/4dpgGvL0wwGEAJS6RczjbRPQ2j9O9xk02RKRsqK+Qojsx6jrPC/bJpGHiZrZb0kIDdI/66hcyF9X1NEvrE62Yvnp+25iM5hwknvTIcqEnZKkCwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHZQ7mFRNDH24ZO/Apdnkglm+mP0xhv+1pZFgZu0yQU=;
 b=pVhvccO5yn02oltx9xLCZFVqgvZNQPO5wZqLwKgSIsVxPeu8U2pKrZTKSSv3dUFpemtxKvzyLxB5SpXufbSd4a2xHd6M7tlMvz4OO5VjNbM4ILtedRhdSQ9mHfD2y4S8//Bfs8f/HwivjBVwAaJv6Lqy/JJEEL6dKB4EaIk3cEU=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
 MWHPR05MB2990.namprd05.prod.outlook.com (10.168.246.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.12; Thu, 21 Nov 2019 14:45:32 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209]) by MWHPR05MB3376.namprd05.prod.outlook.com
 ([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2474.015; Thu, 21 Nov 2019
 14:45:32 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: RE: [PATCH net-next 0/6] vsock: add local transport support
Thread-Topic: [PATCH net-next 0/6] vsock: add local transport support
Thread-Index: AQHVnsi4kz4RAPX5S02yxj8Sa/r70aeVsxKg
Date: Thu, 21 Nov 2019 14:45:32 +0000
Message-ID: <MWHPR05MB3376B8241546664BBCA6FC37DA4E0@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191119110121.14480-1-sgarzare@redhat.com>
In-Reply-To: <20191119110121.14480-1-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0d55e97-e0d6-4485-0e18-08d76e917616
x-ms-traffictypediagnostic: MWHPR05MB2990:
x-microsoft-antispam-prvs: <MWHPR05MB2990F74A0DD06BB9A3BF6C8DDA4E0@MWHPR05MB2990.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
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
x-microsoft-antispam-message-info: pEgvhpcD7UgxVgIdd+loqntBwxfIKRCZIlf0ARPMDXzUf4xMo9BxP6Wz9vi/fojiMmcJUobrbJCjLIb7gLv+DJ/0X/3Qduv4hbUJ9hzX4HA0SB0t8lBqb3SVB/fsjZym85YyLlKmk+C0C3UP6xgyMWeQGuCBJuDq1H0zSafou7iRT/hhvU1YQSonSnEW6nIUqGyRn7gbtmYhGR50BVl0lL/zHu6LpHDxiBDxyJumgE2yvTCf38nMGjHYMjpIYc9/Lqr4QYls4wwMIFBJN0rRkumidqxA7Z/TC/m8HGglPdJquDEpbGXsAdu4C8oIoQ2yL0fAqXEDxqfXzMwH9wgXUxMgUWSRIfiqILB72zKiTd0mO2Kb+H2AwfKynRLjb+tjycvhsl+5cCRtJPEyrOhGdYhnygRYcYZKxxGIMtulFS8dp0UvgHIwqU+Vn9yefdIj
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d55e97-e0d6-4485-0e18-08d76e917616
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 14:45:32.3986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tkywh7tOiRgz+zwDunUrtVuWFTm9QB9jK1Vd4qOPtZEAlp8hUI/dgtec0hl9pcsew/k9xGUwYgB9n+ibbrs8A==
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
> This series introduces a new transport (vsock_loopback) to handle
> local communication.
> This could be useful to test vsock core itself and to allow developers
> to test their applications without launching a VM.
> 
> Before this series, vmci and virtio transports allowed this behavior,
> but only in the guest.
> We are moving the loopback handling in a new transport, because it
> might be useful to provide this feature also in the host or when
> no H2G/G2H transports (hyperv, virtio, vmci) are loaded.
> 
> The user can use the loopback with the new VMADDR_CID_LOCAL (that
> replaces VMADDR_CID_RESERVED) in any condition.
> Otherwise, if the G2H transport is loaded, it can also use the guest
> local CID as previously supported by vmci and virtio transports.
> If G2H transport is not loaded, the user can also use VMADDR_CID_HOST
> for local communication.
> 
> Patch 1 is a cleanup to build virtio_transport_common without virtio
> Patch 2 adds the new VMADDR_CID_LOCAL, replacing
> VMADDR_CID_RESERVED
> Patch 3 adds a new feature flag to register a loopback transport
> Patch 4 adds the new vsock_loopback transport based on the loopback
>         implementation of virtio_transport
> Patch 5 implements the logic to use the local transport for loopback
>         communication
> Patch 6 removes the loopback from virtio_transport
> 
> @Jorgen: Do you think it might be a problem to replace
> VMADDR_CID_RESERVED with VMADDR_CID_LOCAL?

No, that should be fine. It has never allowed for use with stream sockets in
AF_VSOCK. The only potential use would be for datagram sockets, but that
side appears to be unaffected by your changes, since loopback is only
introduced for SOCK_STREAM.

> 
> Thanks,
> Stefano
> 
> Stefano Garzarella (6):
>   vsock/virtio_transport_common: remove unused virtio header includes
>   vsock: add VMADDR_CID_LOCAL definition
>   vsock: add local transport support in the vsock core
>   vsock: add vsock_loopback transport
>   vsock: use local transport when it is loaded
>   vsock/virtio: remove loopback handling
> 
>  MAINTAINERS                             |   1 +
>  include/net/af_vsock.h                  |   2 +
>  include/uapi/linux/vm_sockets.h         |   8 +-
>  net/vmw_vsock/Kconfig                   |  12 ++
>  net/vmw_vsock/Makefile                  |   1 +
>  net/vmw_vsock/af_vsock.c                |  49 +++++-
>  net/vmw_vsock/virtio_transport.c        |  61 +------
>  net/vmw_vsock/virtio_transport_common.c |   3 -
>  net/vmw_vsock/vmci_transport.c          |   2 +-
>  net/vmw_vsock/vsock_loopback.c          | 217
> ++++++++++++++++++++++++
>  10 files changed, 283 insertions(+), 73 deletions(-)
>  create mode 100644 net/vmw_vsock/vsock_loopback.c
> 
> --
> 2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
