Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BE3026E
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 20:55:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 161E22422;
	Thu, 30 May 2019 18:55:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 28F4B1CE0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 18:55:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D05827D2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 18:55:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id D87A914D9DD5B;
	Thu, 30 May 2019 11:55:49 -0700 (PDT)
Date: Thu, 30 May 2019 11:55:49 -0700 (PDT)
Message-Id: <20190530.115549.1509561180724590494.davem@davemloft.net>
To: mst@redhat.com
Subject: Re: [PATCH net-next 0/6] vhost: accelerate metadata access
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190530141243-mutt-send-email-mst@kernel.org>
References: <20190524081218.2502-1-jasowang@redhat.com>
	<20190530.110730.2064393163616673523.davem@davemloft.net>
	<20190530141243-mutt-send-email-mst@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Thu, 30 May 2019 11:55:50 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: hch@infradead.org, linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	jglisse@redhat.com, jrdr.linux@gmail.com,
	linux-arm-kernel@lists.infradead.org, christophe.de.dinechin@gmail.com
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

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 30 May 2019 14:13:28 -0400

> On Thu, May 30, 2019 at 11:07:30AM -0700, David Miller wrote:
>> From: Jason Wang <jasowang@redhat.com>
>> Date: Fri, 24 May 2019 04:12:12 -0400
>> 
>> > This series tries to access virtqueue metadata through kernel virtual
>> > address instead of copy_user() friends since they had too much
>> > overheads like checks, spec barriers or even hardware feature
>> > toggling like SMAP. This is done through setup kernel address through
>> > direct mapping and co-opreate VM management with MMU notifiers.
>> > 
>> > Test shows about 23% improvement on TX PPS. TCP_STREAM doesn't see
>> > obvious improvement.
>> 
>> I'm still waiting for some review from mst.
>> 
>> If I don't see any review soon I will just wipe these changes from
>> patchwork as it serves no purpose to just let them rot there.
>> 
>> Thank you.
> 
> I thought we agreed I'm merging this through my tree, not net-next.
> So you can safely wipe it.

Aha, I didn't catch that, thanks!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
