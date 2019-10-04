Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E50CC4C5
	for <lists.virtualization@lfdr.de>; Fri,  4 Oct 2019 23:25:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6E19FDD9;
	Fri,  4 Oct 2019 21:25:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE3A0C00
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 21:25:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1BE7234F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 21:25:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 2466714F0FA8D;
	Fri,  4 Oct 2019 14:25:30 -0700 (PDT)
Date: Fri, 04 Oct 2019 14:25:29 -0700 (PDT)
Message-Id: <20191004.142529.870317230438336454.davem@davemloft.net>
To: adobriyan@gmail.com
Subject: Re: [PATCH net-next] net, uapi: fix -Wpointer-arith warnings
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191003202924.GA21016@avx2>
References: <20191003202924.GA21016@avx2>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Fri, 04 Oct 2019 14:25:30 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jon.maloy@ericsson.com, mst@redhat.com, netdev@vger.kernel.org,
	fw@strlen.de, kadlec@netfilter.org,
	netfilter-devel@vger.kernel.org, ying.xue@windriver.com,
	virtualization@lists.linux-foundation.org, pablo@netfilter.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 3 Oct 2019 23:29:24 +0300

> Add casts to fix these warnings:
> 
> ./usr/include/linux/netfilter_arp/arp_tables.h:200:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> ./usr/include/linux/netfilter_bridge/ebtables.h:197:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> ./usr/include/linux/netfilter_ipv4/ip_tables.h:223:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> ./usr/include/linux/netfilter_ipv6/ip6_tables.h:263:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> ./usr/include/linux/tipc_config.h:310:28: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> ./usr/include/linux/tipc_config.h:410:24: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> ./usr/include/linux/virtio_ring.h:170:16: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
> 
> Those are theoretical probably but kernel doesn't control compiler flags
> in userspace.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

Applied.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
