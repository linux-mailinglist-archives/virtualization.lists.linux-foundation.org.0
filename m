Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DF59FAB908
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 15:15:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 673C121D1;
	Fri,  6 Sep 2019 13:15:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6193521CC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:15:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1B9317DB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:15:09 +0000 (UTC)
Received: from localhost (unknown [88.214.184.128])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 78D8F152F5C9A;
	Fri,  6 Sep 2019 06:15:06 -0700 (PDT)
Date: Fri, 06 Sep 2019 15:15:05 +0200 (CEST)
Message-Id: <20190906.151505.1486178691190611604.davem@davemloft.net>
To: jasowang@redhat.com
Subject: Re: [PATCH 0/2] Revert and rework on the metadata accelreation
From: David Miller <davem@davemloft.net>
In-Reply-To: <7785d39b-b4e7-8165-516c-ee6a08ac9c4e@redhat.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905135907.GB6011@mellanox.com>
	<7785d39b-b4e7-8165-516c-ee6a08ac9c4e@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Fri, 06 Sep 2019 06:15:08 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	jglisse@redhat.com, jgg@mellanox.com
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Jason Wang <jasowang@redhat.com>
Date: Fri, 6 Sep 2019 18:02:35 +0800

> On 2019/9/5 下午9:59, Jason Gunthorpe wrote:
>> I think you should apply the revert this cycle and rebase the other
>> patch for next..
>>
>> Jason
> 
> Yes, the plan is to revert in this release cycle.

Then you should reset patch #1 all by itself targetting 'net'.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
