Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BBC4583
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 03:27:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E5E5249F;
	Wed,  2 Oct 2019 01:27:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 907031700
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 01:27:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4CD841FB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 01:27:32 +0000 (UTC)
Received: from localhost (unknown
	[IPv6:2603:3023:50c:85e1:b5c5:ae11:3e54:6a07])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id AD73414D8BB4A;
	Tue,  1 Oct 2019 18:27:31 -0700 (PDT)
Date: Tue, 01 Oct 2019 21:27:28 -0400 (EDT)
Message-Id: <20191001.212728.1087995517897062240.davem@davemloft.net>
To: matiasevara@gmail.com
Subject: Re: [PATCH net-next v2] vsock/virtio: add support for MSG_PEEK
From: David Miller <davem@davemloft.net>
In-Reply-To: <1569867923-28200-1-git-send-email-matiasevara@gmail.com>
References: <1569867923-28200-1-git-send-email-matiasevara@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Tue, 01 Oct 2019 18:27:32 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: eric.dumazet@gmail.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	sgarzare@redhat.com
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

From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Date: Mon, 30 Sep 2019 18:25:23 +0000

> This patch adds support for MSG_PEEK. In such a case, packets are not
> removed from the rx_queue and credit updates are not sent.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Tested-by: Stefano Garzarella <sgarzare@redhat.com>

Applied.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
