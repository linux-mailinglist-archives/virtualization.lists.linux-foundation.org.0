Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D736224D4
	for <lists.virtualization@lfdr.de>; Sat, 18 May 2019 22:27:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 57928A49;
	Sat, 18 May 2019 20:27:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A48917A9
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 20:27:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 690095E4
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 20:27:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 912F614DF4C35;
	Sat, 18 May 2019 13:27:13 -0700 (PDT)
Date: Sat, 18 May 2019 13:27:12 -0700 (PDT)
Message-Id: <20190518.132712.1971625204431294331.davem@davemloft.net>
To: jasowang@redhat.com
Subject: Re: [PATCH V2 0/4] Prevent vhost kthread from hogging CPU
From: David Miller <davem@davemloft.net>
In-Reply-To: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
References: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Sat, 18 May 2019 13:27:13 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com
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

From: Jason Wang <jasowang@redhat.com>
Date: Fri, 17 May 2019 00:29:48 -0400

> Hi:
> 
> This series try to prevent a guest triggerable CPU hogging through
> vhost kthread. This is done by introducing and checking the weight
> after each requrest. The patch has been tested with reproducer of
> vsock and virtio-net. Only compile test is done for vhost-scsi.
> 
> Please review.
> 
> This addresses CVE-2019-3900.
> 
> Changs from V1:
> - fix user-ater-free in vosck patch

I am assuming that not only will mst review this, it will also go via
his tree rather than mine.

Thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
