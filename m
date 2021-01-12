Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568F2F292E
	for <lists.virtualization@lfdr.de>; Tue, 12 Jan 2021 08:50:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D63386857;
	Tue, 12 Jan 2021 07:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilTzHWFeD35N; Tue, 12 Jan 2021 07:50:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8B5D86814;
	Tue, 12 Jan 2021 07:50:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D60F0C088B;
	Tue, 12 Jan 2021 07:50:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6BDC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4852E204B9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-NGWRIMOwW0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:50:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 1033623120
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:50:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D4822D2C;
 Tue, 12 Jan 2021 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610437803;
 bh=kg2dqaMFQ8oukwEarLjgYCUa05H4ThHj9S7L1S+e8aI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HT3FEp67PMNc2d2EmV8QEffKY8rhHyLP7wXcv2Dzx7Fj3zyB2fDwnt40yTKpUsnNh
 GWVfhyKe9L1KBFOKaly7Ox8lPncqsOJfxfmFfrtYW4onw2CpMOakb0yQj558I/0gAo
 eQOf7cLpO9fYVVWk46fwjOU47L07h4bkMWWTCeAM=
Date: Tue, 12 Jan 2021 08:49:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v3] vhost_vdpa: fix the problem in
 vhost_vdpa_set_config_call
Message-ID: <X/1Up+fcTcYq2osi@kroah.com>
References: <20210112053629.9853-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112053629.9853-1-lulu@redhat.com>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, lingshan.zhu@intel.com
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

On Tue, Jan 12, 2021 at 01:36:29PM +0800, Cindy Lu wrote:
> In vhost_vdpa_set_config_call, the cb.private should be vhost_vdpa.
> this cb.private will finally use in vhost_vdpa_config_cb as
> vhost_vdpa. Fix this issue.
> 
> Fixes: 776f395004d82 ("vhost_vdpa: Support config interrupt in vdpa")
> Acked-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  drivers/vhost/vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
