Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D21703C8
	for <lists.virtualization@lfdr.de>; Wed, 26 Feb 2020 17:07:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DFAF87A8D;
	Wed, 26 Feb 2020 16:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Av-VjI4I2r0l; Wed, 26 Feb 2020 16:07:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60B3785933;
	Wed, 26 Feb 2020 16:07:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53DE7C0177;
	Wed, 26 Feb 2020 16:07:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 538BCC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 16:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3DBBE870B3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 16:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DS5o4IM1t9Bo
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 16:07:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9FD698172A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582733244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VC/fSjW6Q9Zf1CVil4K0XbAX6oR7WGL2RegTKV0OEzU=;
 b=VV8ZZEsOg+iP2dzMQmnmeE1uyL4OQyIMvecZ9OyXv7JsDRKFjnIZFUZLQJKYMNznu2/cvB
 nRzHbp43wYFKwKdw+mnyU81jkTtsgjOY1Yfzr1bor27e+ZtAtxiLlt6NuWOCuL0nekqIlO
 Fy+3SVot8P/6bDspw//r8FdXTkpelqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-WhzkhL_bOrG6VaE3qtfNWQ-1; Wed, 26 Feb 2020 11:07:20 -0500
X-MC-Unique: WhzkhL_bOrG6VaE3qtfNWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC398018A1;
 Wed, 26 Feb 2020 16:07:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA69319C69;
 Wed, 26 Feb 2020 16:07:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCA821FCE8; Wed, 26 Feb 2020 17:07:14 +0100 (CET)
Date: Wed, 26 Feb 2020 17:07:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [virtio-dev] Re: [PATCH 1/2] virtio: add dma-buf support for
 exported objects
Message-ID: <20200226160714.y2wt5ubtklljn576@sirius.home.kraxel.org>
References: <20200219080637.61312-1-stevensd@chromium.org>
 <20200219080637.61312-2-stevensd@chromium.org>
 <20200225061008.wqxqppfglzmwvtid@sirius.home.kraxel.org>
 <CAD=HUj7h1d8dXG94FUtj4fmeUvUM0dm6NW8WHGZAceHae0zGLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj7h1d8dXG94FUtj4fmeUvUM0dm6NW8WHGZAceHae0zGLw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: virtio-dev@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Wed, Feb 26, 2020 at 12:56:58PM +0900, David Stevens wrote:
> On Tue, Feb 25, 2020 at 3:10 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > How about dma_buf_{get,set}_uuid, simliar to dma_buf_set_name?
> 
> While I'm not opposed to such an API, I'm also hesitant to make
> changes to the dma-buf API for a single use case.

See virtio-wayland discussion.  I expect we will see more cases show up.
Maybe this should even go one level up, to struct file.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
