Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D0B3EEF66
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 17:48:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F4660B7D;
	Tue, 17 Aug 2021 15:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asgkRimAu2rD; Tue, 17 Aug 2021 15:48:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1FD95611D8;
	Tue, 17 Aug 2021 15:48:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95EBBC000E;
	Tue, 17 Aug 2021 15:48:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1DE7C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 15:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D225940525
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 15:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1cO3eCRvjJs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 15:48:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D85D0404EF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 15:48:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E254460F58;
 Tue, 17 Aug 2021 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629215290;
 bh=5H+7vJbliQsK8rs/+6iZ2HR7NrfuQkz/HOEYxQLMkoI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pK+MLTaqQaH4Vkn15pGfHDsShIQF/E8n2g8oBolYwxlF9M4WGXhND3rv0j/TUhOuD
 HiRo3zpGif/fRzNswPlKWa93QFr85bNRh1wNFt2EYzO0LpWZEiiG1iYNikRRNN/spO
 GeiaoWrNZS7RoMl81z0aN9Kx2cNsBbzlF/6gi1lY=
Date: Tue, 17 Aug 2021 17:48:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v7 1/2] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YRvaN0RwW03kkO1O@kroah.com>
References: <20210817132300.165014-1-xianting.tian@linux.alibaba.com>
 <20210817132300.165014-2-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817132300.165014-2-xianting.tian@linux.alibaba.com>
Cc: arnd@arndb.de, amit@kernel.org, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, osandov@fb.com
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

On Tue, Aug 17, 2021 at 09:22:59PM +0800, Xianting Tian wrote:
> We tested the patch, it worked normally.

Who is "we"?

> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

Like I said before, I need another developer from your company to review
and sign-off on this patch (and the other one), before I am willing to
look at it, based on the previous mistakes that have happened here.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
