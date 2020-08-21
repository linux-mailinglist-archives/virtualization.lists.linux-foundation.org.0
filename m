Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7324CE5F
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 09:02:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 851A386C93;
	Fri, 21 Aug 2020 07:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_l8BhNIAr6Z; Fri, 21 Aug 2020 07:01:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A02CD86C8D;
	Fri, 21 Aug 2020 07:01:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 821FFC0051;
	Fri, 21 Aug 2020 07:01:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7643C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CFAD487B41
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5bJmrL4IKpA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:01:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 869618791E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597993315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yIGSYjFFLTVb50eqymJwc16CIZ3D03wNNhMqT2v4fFo=;
 b=dJzbMLf6JSbI03dJs5zPtqRKpaYnFnnn0M4/n6yA8MIgj4GLCSpO3rK+5kFmzSVioRXwvD
 rsbQ9cpCf7OFI1aV9Q1Rc1fXFnZQKw7uSL6nGuci7j6YF2wjgKeqvZUO4Vv66VUTWLkG2w
 MtpLw5Ngo6ZE11mYk1atQPNobHSF/EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-bmWLZW8UPxSpNitocniUOw-1; Fri, 21 Aug 2020 03:01:45 -0400
X-MC-Unique: bmWLZW8UPxSpNitocniUOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14FD1084C91;
 Fri, 21 Aug 2020 07:01:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489C95DA7E;
 Fri, 21 Aug 2020 07:01:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 36D4E241; Fri, 21 Aug 2020 09:01:42 +0200 (CEST)
Date: Fri, 21 Aug 2020 09:01:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
Message-ID: <20200821070142.iwobpibai6aavpl6@sirius.home.kraxel.org>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <20200709123339.547390-2-daniel.vetter@ffwll.ch>
 <5cb80369-75a5-fc83-4683-3a6fc2814104@kernel.org>
 <20200819132408.jnqjhdgd4jbnarhh@sirius.home.kraxel.org>
 <8a80b434-c8ed-daa3-753b-dd2ec89b9067@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a80b434-c8ed-daa3-753b-dd2ec89b9067@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
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

On Thu, Aug 20, 2020 at 08:32:51AM +0200, Jiri Slaby wrote:
> On 19. 08. 20, 15:24, Gerd Hoffmann wrote:
> > On Wed, Aug 19, 2020 at 02:43:28PM +0200, Jiri Slaby wrote:
> >> On 09. 07. 20, 14:33, Daniel Vetter wrote:
> >>> Exactly matches the one in the helpers.
> >>
> >> It's not that exact. The order of modeset_enables and planes is
> >> different. And this causes a regression -- no fb in qemu.
> > 
> > Does https://patchwork.freedesktop.org/patch/385980/ help?
> 
> Yes, it does.

Any chance you can send a tested-by & acked-by for the series so I can
get it merged?

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
