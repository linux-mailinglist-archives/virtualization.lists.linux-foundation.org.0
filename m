Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCB178C39
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 09:05:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67FEE87889;
	Wed,  4 Mar 2020 08:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsSl35acfQw7; Wed,  4 Mar 2020 08:05:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3BB487874;
	Wed,  4 Mar 2020 08:05:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B58C7C013E;
	Wed,  4 Mar 2020 08:05:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4628EC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 422F086416
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luUB7M-rPd5W
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 529BA84DFD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583309151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEXp+MsDMiIQ48dZsIdgW3c7/qT3rYq7zxn6pOdg4xA=;
 b=Z+9ouQCQ7uUhd6LOZxj37nz54snx51YAFSHnUeF8JFo0RESNiHOgiKl3gQXXD4ZpzqyyrB
 5UQlN0JIsiTBdr0ApmIwvhE4XlNTVDiYoqSf/i4oENm7waeeFeX0vRUgPf8Aoecr6yA+iP
 PON63liHTYiolpXayHC8SlBybsvKtC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-LfdfQ2d3O6mP8LQD7TgVEQ-1; Wed, 04 Mar 2020 03:05:49 -0500
X-MC-Unique: LfdfQ2d3O6mP8LQD7TgVEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6149E801E6C;
 Wed,  4 Mar 2020 08:05:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41D545DA60;
 Wed,  4 Mar 2020 08:05:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7778C17506; Wed,  4 Mar 2020 09:05:43 +0100 (CET)
Date: Wed, 4 Mar 2020 09:05:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [virtio-dev] [PATCH v2 4/4] drm/virtio: Support virtgpu exported
 resources
Message-ID: <20200304080543.jtf3kcfp6cyegkag@sirius.home.kraxel.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
 <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
 <CAD=HUj5-0CE-tm4meQ_Y7KB4Df41v=kBH2GTStYJptTOSp1yVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj5-0CE-tm4meQ_Y7KB4Df41v=kBH2GTStYJptTOSp1yVw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, linaro-mm-sig@lists.linaro.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
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

On Tue, Mar 03, 2020 at 11:42:22AM +0900, David Stevens wrote:
> > cmd_p->hdr.ctx_id =
> >
> > Before this completion of this hypercall, this resource can be
> > considered context local, while afterward it can be considered
> > "exported".
> 
> Maybe I'm misunderstanding render contexts, but exporting a resource
> doesn't seem related to render contexts.

It isn't indeed.  Binding resources to contexts might need dma-buf
imports/exports on the host side, but that is another story and not
related to dma-buf exports inside the guest.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
