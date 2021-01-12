Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9072F292D
	for <lists.virtualization@lfdr.de>; Tue, 12 Jan 2021 08:49:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FDA786814;
	Tue, 12 Jan 2021 07:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGeJIevfs-Sf; Tue, 12 Jan 2021 07:49:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68275867A1;
	Tue, 12 Jan 2021 07:49:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41381C013A;
	Tue, 12 Jan 2021 07:49:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E77BC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 84EDF867A1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOTexDLRs3ys
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:49:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0ED7D8678A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 07:49:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F34CE20739;
 Tue, 12 Jan 2021 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610437789;
 bh=/6DFCCaRYUp6K/lYBRxihjG38D3Texx1g45T4/icnMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I78GCH1wwsEEUAsd+drOEFwauvHcPzLIh30yuD1zKCNXaQHhlWQLEUtX1XZFWx0aP
 eWhjO9ZXwKFMOZIjtl+mYHgYy+PKc752UM/35D71ulTMaIxv0TkmLO3xQoQa7e7ox5
 nTcUyQLtj8YhEFQJ3PsrbMLBTozTvhyL4FNdy7/g=
Date: Tue, 12 Jan 2021 08:49:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v2] vhost_vdpa: fix the problem in
 vhost_vdpa_set_config_call
Message-ID: <X/1UmaAb8j2eot5Q@kroah.com>
References: <20210112053227.8574-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112053227.8574-1-lulu@redhat.com>
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

On Tue, Jan 12, 2021 at 01:32:27PM +0800, Cindy Lu wrote:
> In vhost_vdpa_set_config_call, the cb.private should be vhost_vdpa.
> this cb.private will finally use in vhost_vdpa_config_cb as
> vhost_vdpa. Fix this issue.
> 
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
