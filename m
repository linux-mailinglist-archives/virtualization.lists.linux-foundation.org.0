Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CAD198A2A
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 04:52:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA1E985F46;
	Tue, 31 Mar 2020 02:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIotHPERQ83R; Tue, 31 Mar 2020 02:52:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C8B285F4B;
	Tue, 31 Mar 2020 02:52:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60DBAC07FF;
	Tue, 31 Mar 2020 02:52:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57514C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4681186BE0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCwSaJyELITr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:52:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A808B86BC9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=vwCf88W8uI6kfyG9YNKfcw+W9JvoHdjdDO+HJg3PNl8=; b=sn1cOMq2OvxDWuQvY1sqwfGIqY
 2peckD9Zh838ABaFcldXtRD0MvqgMI5wFlWDh5MpEkZrCxIzwAvgRqVR3idX4v+4yAd5r5V2n7Wze
 mChwjmY/4fxP9FxzcZGwP9uiNuicvD/s3MYA4oAAOJD5EREB1cWYqvWthJHKgi3JcARtYvP+P7Hhy
 mE7uz5mWVsIhsEDu+zwAV6mQ/Z64i6OAkhmQcrx20Nk/2L3WkHrx4aBMwumcOIt1MMssnRx517Pu7
 yfOYQzNX1tlRlWtaOQh5t0hiPzGi2U0N2vvub8ZB37jN5sn8siFm18w2X6+FXi2CO6P78UosmjAFL
 w1Wiv9yw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ71F-0003W5-Or; Tue, 31 Mar 2020 02:52:49 +0000
Subject: Re: [PATCH] vhost: make CONFIG_VHOST depend on CONFIG_EVENTFD
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20200331022902.12229-1-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5646e48a-b1af-6253-bc17-667ab9419fd3@infradead.org>
Date: Mon, 30 Mar 2020 19:52:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331022902.12229-1-jasowang@redhat.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 3/30/20 7:29 PM, Jason Wang wrote:
> After commit ec9d8449a99b ("vhost: refine vhost and vringh kconfig"),
> CONFIG_VHOST could be enabled independently. This means we need make
> CONFIG_VHOST depend on CONFIG_EVENTFD, otherwise we break compiling
> without CONFIG_EVENTFD.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: ec9d8449a99b ("vhost: refine vhost and vringh kconfig")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

thanks.

-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
