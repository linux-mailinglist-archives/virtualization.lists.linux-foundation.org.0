Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E277AD397
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 09:18:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8D7FDB1;
	Mon,  9 Sep 2019 07:18:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BD96AC8
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:18:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3AA2FEC
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:18:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8386310576CC;
	Mon,  9 Sep 2019 07:18:29 +0000 (UTC)
Received: from [10.72.12.61] (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A73161001948;
	Mon,  9 Sep 2019 07:18:06 +0000 (UTC)
Subject: Re: [PATCH 0/2] Revert and rework on the metadata accelreation
To: David Miller <davem@davemloft.net>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905135907.GB6011@mellanox.com>
	<7785d39b-b4e7-8165-516c-ee6a08ac9c4e@redhat.com>
	<20190906.151505.1486178691190611604.davem@davemloft.net>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bb9ae371-58b7-b7fc-b728-b5c5f55d3a91@redhat.com>
Date: Mon, 9 Sep 2019 15:18:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906.151505.1486178691190611604.davem@davemloft.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Mon, 09 Sep 2019 07:18:29 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="iso-2022-jp"; Format="flowed"; DelSp="yes"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


On 2019/9/6 下午9:15, David Miller wrote:
> From: Jason Wang <jasowang@redhat.com>
> Date: Fri, 6 Sep 2019 18:02:35 +0800
>
>> On 2019/9/5 下午9:59, Jason Gunthorpe wrote:
>>> I think you should apply the revert this cycle and rebase the other
>>> patch for next..
>>>
>>> Jason
>> Yes, the plan is to revert in this release cycle.
> Then you should reset patch #1 all by itself targetting 'net'.


Thanks for the reminding. I want the patch to go through Michael's vhost  
tree, that's why I don't put 'net' prefix. For next time, maybe I can  
use "vhost" as a prefix for classification?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
