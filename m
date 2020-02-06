Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 029FF1540B7
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 09:55:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D6FD81D83;
	Thu,  6 Feb 2020 08:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3cncKDCm3md; Thu,  6 Feb 2020 08:55:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AACA8489F;
	Thu,  6 Feb 2020 08:55:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D02EC013E;
	Thu,  6 Feb 2020 08:55:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 210BAC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 17E0784478
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ko3axqlKPWU
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:55:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8364B85CD8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580979345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lidKg4bME34cT2lBAp3X3adgq0pupsYNedp4gCMJOiw=;
 b=gpt4lX2HVCa9DEF7a+BG2Hx8m8/Wrxu20HLFPSr/4SS7Ff5hhRd041lRxICjYDnkuuKFjZ
 zgaO4lXWzxq+LvRHlcfuV8fENATBaJh6TKZqImiuEWMobO8knEy/HNLuhM/NFX+P1BZ3B5
 iO2hlVP4g9F9pYOUYc8gzT8dvz6pBUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-E5-DoGFDM6CyTIgV6pnwxg-1; Thu, 06 Feb 2020 03:55:43 -0500
X-MC-Unique: E5-DoGFDM6CyTIgV6pnwxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F7D1937FC4;
 Thu,  6 Feb 2020 08:55:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 672025DA75;
 Thu,  6 Feb 2020 08:55:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8510C1747D; Thu,  6 Feb 2020 09:55:40 +0100 (CET)
Date: Thu, 6 Feb 2020 09:55:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH 4/4] drm/virtio: move virtio_gpu_mem_entry initialization
 to new function
Message-ID: <20200206085540.pa6py4ieoi242gma@sirius.home.kraxel.org>
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-5-kraxel@redhat.com>
 <CAPaKu7RxijC_oS4GPukS9wEe9gn8DPQgaGZKwG6g8M8xwTnsig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7RxijC_oS4GPukS9wEe9gn8DPQgaGZKwG6g8M8xwTnsig@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
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

  Hi,

> >         virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
> > -                                              ents, nents,
> > +                                              obj->ents, obj->nents,
> >                                                fence);
> > +       obj->ents = NULL;
> > +       obj->nents = 0;
> Hm, if the entries are temporary, can we allocate and initialize them
> in this function?

Well, the plan for CREATE_RESOURCE_BLOB is to use obj->ents too ...

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
