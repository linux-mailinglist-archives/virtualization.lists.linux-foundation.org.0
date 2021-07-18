Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A793CC72A
	for <lists.virtualization@lfdr.de>; Sun, 18 Jul 2021 03:41:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923DD60659;
	Sun, 18 Jul 2021 01:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJ2P8AYo2UHO; Sun, 18 Jul 2021 01:41:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 761DD60692;
	Sun, 18 Jul 2021 01:41:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFF27C000E;
	Sun, 18 Jul 2021 01:41:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBC6DC000E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jul 2021 01:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9658783C9A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jul 2021 01:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-ENDl8YVN7a
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jul 2021 01:41:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 103FC83C97
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jul 2021 01:41:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 347F361159;
 Sun, 18 Jul 2021 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626572487;
 bh=y4LVREzYXxclRGUfOfs3DtOMn9JOani/4YZmmLMPFL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCmdq19Bc8PhNfD2IPG99l+CW0c+ZBQOY5y3fbcxhXSp9k/sdVKTZS39ea+0IArAU
 MQAZEsKwtKzEAx+2McLwN4qCb3sNnmmMhj/nOIg119DXb5IXwL2ndJ+9TUs+a90+XQ
 WHyLPS9MpzHt/9S7fTrNXC34d82g1lV9PWb9+J7qa1NesY0LhysoaM/Gxbzavb3ajQ
 kydnUxhnEyNIAJFIgVzjNbiCDTULO6/bS3Q2bbu/jsxOAjxWkuO0EZlC3YLMENLYDz
 0g6dAnA5OShI2zVShZrcGTX7R7ueefc/oZ1MFCYceJBf9X7+VeT+rSxVIc4QtMhRhP
 8kTUgoOWamxpw==
Date: Sat, 17 Jul 2021 21:41:26 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.12 42/43] virtio: fix up virtio_disable_cb
Message-ID: <YPOGxjBcq6f4l+0v@sashalap>
References: <20210710234915.3220342-1-sashal@kernel.org>
 <20210710234915.3220342-42-sashal@kernel.org>
 <20210711002242-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210711002242-mutt-send-email-mst@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sun, Jul 11, 2021 at 12:23:59AM -0400, Michael S. Tsirkin wrote:
>On Sat, Jul 10, 2021 at 07:49:14PM -0400, Sasha Levin wrote:
>> From: "Michael S. Tsirkin" <mst@redhat.com>
>>
>> [ Upstream commit 8d622d21d24803408b256d96463eac4574dcf067 ]
>>
>> virtio_disable_cb is currently a nop for split ring with event index.
>> This is because it used to be always called from a callback when we know
>> device won't trigger more events until we update the index.  However,
>> now that we run with interrupts enabled a lot we also poll without a
>> callback so that is different: disabling callbacks will help reduce the
>> number of spurious interrupts.
>> Further, if using event index with a packed ring, and if being called
>> from a callback, we actually do disable interrupts which is unnecessary.
>>
>> Fix both issues by tracking whenever we get a callback. If that is
>> the case disabling interrupts with event index can be a nop.
>> If not the case disable interrupts. Note: with a split ring
>> there's no explicit "no interrupts" value. For now we write
>> a fixed value so our chance of triggering an interupt
>> is 1/ring size. It's probably better to write something
>> related to the last used index there to reduce the chance
>> even further. For now I'm keeping it simple.
>>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>I am not sure we want this in stable yet. It should in theory
>fix the reported interrupt storms but the reporter is on vacation.

Sure, I'll drop it for now. Let me know when you want it re-added.
Thanks!

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
