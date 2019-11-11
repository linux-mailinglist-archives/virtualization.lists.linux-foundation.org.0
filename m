Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E39F78C0
	for <lists.virtualization@lfdr.de>; Mon, 11 Nov 2019 17:27:39 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DBC72DB5;
	Mon, 11 Nov 2019 16:27:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB5A8D9E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 16:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8CCE18AD
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 16:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fDVBZvng1L1nZE7ijn2zvodLoxKCtZoznf+XlfFe9yNlhX71zHu6LoHebsYDCE5LGB0Ij9+wyk7pp+yA3tbgUu+rth9sP/eFSei6osXy9JSzaLySZqsWwzvKte9QkCxOSdi6fXdOI++ukWA6Ul+uGahfN1AkAwxtMUdNLcqTBg4Vo8eOLaI3FPYmoDoJuw5x/8/wtQdaHeoAJMa9zru9C49KnWXfGra1AZ2ijqxJTxPe25fJ8yRgVon6ertGuQv4bQOyTbzq/+TelBhkDXAB5ZYnTSgiUjgWFGnFktpSnuzFCS8fo1qxIAMdYysBR5/DsY8vXZYF2TE1c1fygUa5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AXvAtoe6H0nGMj7s82Yhp9LrKED1RsO+HXsUKBqTz9M=;
	b=R8ijmwXW4MtAAcqwkjDcWjAWiUDxiFl0OB3zgQR5S/HroXrd4G/nfu+OhIQbk1MiXVsS7kNVkTl5WuFM84smOWFvkthOAGAMvOhlmq/q+ZzxfUIgneZ4VQNmbFUe4fm9mp0ewV0lxnAwDcMABeq/eshNo/ZJkrn4LohYudZ9Y+/hSFU9GiWnXxYQHWzxFNBW/9/7X6kBZczzv7s9iWYbWpgUdYAi0a7Zkqm4nYh1r/b1y8mc48w04vsjEDAPahm9esg6edvIrDRTh7sCSfmKIFS7ICFiIlM5TpDynlq4bCWHdbc5HlwC60YWpoETbhxxcMTfSAG2kxmUfrVYcY44ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AXvAtoe6H0nGMj7s82Yhp9LrKED1RsO+HXsUKBqTz9M=;
	b=Bm8ip3yME644tIOCnCxoUiMoucUIjJTxSBkF8+qXkv3YE1NsP8qDB7KPpltb6Ttc/3WvWFg2L0Znmrf4rA3Sa0rW1F0btSYf1UwLBB2tjKR0/sntf7+pdD4HESBYJQaU7YmY4indZJRTCRgdtSWAQiqfv7kBMIlPpjcm3d1X2WQ=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
	MWHPR05MB3486.namprd05.prod.outlook.com (10.174.250.164) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.17; Mon, 11 Nov 2019 16:27:28 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209]) by
	MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2451.018;
	Mon, 11 Nov 2019 16:27:28 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Thread-Topic: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Thread-Index: AQHViYhpRc2q1qJxVEORBsxH5VDhoaeGP/hg
Date: Mon, 11 Nov 2019 16:27:28 +0000
Message-ID: <MWHPR05MB3376266BC6AE9E6E0B75F1A1DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-13-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a36f301-eeef-4b0b-3e63-08d766c40b58
x-ms-traffictypediagnostic: MWHPR05MB3486:
x-microsoft-antispam-prvs: <MWHPR05MB34869134C628EC8AE5E94152DA740@MWHPR05MB3486.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(199004)(189003)(9686003)(14454004)(55016002)(6506007)(256004)(7696005)(81166006)(229853002)(54906003)(2501003)(102836004)(186003)(110136005)(6436002)(81156014)(7416002)(99286004)(26005)(8936002)(4326008)(71190400001)(71200400001)(2906002)(76176011)(478600001)(446003)(3846002)(6116002)(25786009)(6246003)(74316002)(305945005)(7736002)(76116006)(316002)(8676002)(86362001)(52536014)(66066001)(476003)(33656002)(486006)(66476007)(5660300002)(64756008)(66556008)(11346002)(66446008)(66946007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB3486;
	H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fexRGydaepfMKWtbl4XysVBFMqAFL73AQytNS1zhQu8sVwe1zj6bNYBsloVpasVJn+Etkebh3yMq293S/YPvN4B7sb8i7whCh1+bme4tHGKorgZuUpm2okqQYOXuBgUOK5rqKUTxN97gkPAXquvliUChnh5Izi5P0dbQL9/OFFV/VRxe19byHFPlHRdC7ucq2Wcyt1I6q4Hi1sl8o8Q1UcJePDnZiNBL6oUps+K10Y9POmCMpXcL+aartSNqb7Cr3RpnreubcgB/Ml2DIoE5UgmFc1/tyNcTkzcjQUGBHoLOFQNUevbMVoK00jnvufP0SEwJ3v+wZIJNNHpEp+X6x8zLC0BJwawW3N/tBdjAOK4qAHIZg/V0HyHhUdPmmXZJeaZKYJEJvrfElqOvKi9k83evnzscSCibeK4WBe31Lr65L1wj+fl6mVCvWU4WHj1H
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a36f301-eeef-4b0b-3e63-08d766c40b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 16:27:28.4501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zes/fuRBeZrVaUaxor5w4oSlnj5fdFyL10fL4oTqcXlREj841iXVflQPPiHYSg/SqqZtcwHpSo8XqTW3elt8ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3486
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
> 
> To allow other transports to be loaded with vmci_transport,
> we register the vmci_transport as G2H or H2G only when a VMCI guest
> or host is active.
> 
> To do that, this patch adds a callback registered in the vmci driver
> that will be called when a new host or guest become active.
> This callback will register the vmci_transport in the VSOCK core.
> If the transport is already registered, we ignore the error coming
> from vsock_core_register().

So today this is mainly an issue for the VMCI vsock transport, because
VMCI autoloads with vsock (and with this solution it can continue to
do that, so none of our old products break due to changed behavior,
which is great). Shouldn't vhost behave similar, so that any module
that registers a h2g transport only does so if it is in active use?


> --- a/drivers/misc/vmw_vmci/vmci_host.c
> +++ b/drivers/misc/vmw_vmci/vmci_host.c
> @@ -108,6 +108,11 @@ bool vmci_host_code_active(void)
>  	     atomic_read(&vmci_host_active_users) > 0);
>  }
> 
> +int vmci_host_users(void)
> +{
> +	return atomic_read(&vmci_host_active_users);
> +}
> +
>  /*
>   * Called on open of /dev/vmci.
>   */
> @@ -338,6 +343,8 @@ static int vmci_host_do_init_context(struct
> vmci_host_dev *vmci_host_dev,
>  	vmci_host_dev->ct_type = VMCIOBJ_CONTEXT;
>  	atomic_inc(&vmci_host_active_users);
> 
> +	vmci_call_vsock_callback(true);
> +

Since we don't unregister the transport if user count drops back to 0, we could
just call this the first time, a VM is powered on after the module is loaded.

>  	retval = 0;
> 
>  out:

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
