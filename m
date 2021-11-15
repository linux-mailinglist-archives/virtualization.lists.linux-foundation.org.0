Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01444FE96
	for <lists.virtualization@lfdr.de>; Mon, 15 Nov 2021 07:08:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD1D6075A;
	Mon, 15 Nov 2021 06:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGrAM5BNtHxq; Mon, 15 Nov 2021 06:08:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E8E260717;
	Mon, 15 Nov 2021 06:08:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2F95C0036;
	Mon, 15 Nov 2021 06:08:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DFAAC0012
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 06:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37DB1402CB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 06:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfU4OxXVxQQk
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 06:08:31 +0000 (UTC)
X-Greylist: delayed 00:15:56 by SQLgrey-1.8.0
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFD44402C8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 06:08:30 +0000 (UTC)
Received: from BC-Mail-Ex28.internal.baidu.com (unknown [172.31.51.22])
 by Forcepoint Email with ESMTPS id 0881AA0824D8B20B2362;
 Mon, 15 Nov 2021 13:52:25 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex28.internal.baidu.com (172.31.51.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 15 Nov 2021 13:52:24 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2308.014; Mon, 15 Nov 2021 13:52:24 +0800
From: "Liu,Feng(INF)" <liufeng32@baidu.com>
To: "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: question about vdpa_mgmt_dev
Thread-Topic: question about vdpa_mgmt_dev
Thread-Index: AdfZ4sMOlabm7KnAQ6a4Hg+80hubZQ==
Date: Mon, 15 Nov 2021 05:52:24 +0000
Message-ID: <10b3825413da4a73ac8cdce9eca5e860@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.205.44]
MIME-Version: 1.0
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

Hi Experts
	I have read the upstream code about vdpa, and I notice that there is a new struct vdpa_mgmt_dev have been added.
	Every driver implements dev_add() interface, such as mlx5 use mlx5_vdpa_dev_add(). This interface completes the creation of the vdpa device, hardware initialization and system registration. And I found that only netlink will call the dev_add() interface, in vdpa_nl_cmd_dev_add_set_doit(). While the probe() function just register vdpa_mgmt_dev without call dev_add()
	So, my questions are:
	Does it create a vdpa device only through the netlink interface? The system scans the PCI device and does not automatically create the corresponding vdpa device?
	

Thanks
Feng

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
