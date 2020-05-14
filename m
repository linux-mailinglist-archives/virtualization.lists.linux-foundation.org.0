Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C14711D2FB8
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 14:30:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4DC5922D44;
	Thu, 14 May 2020 12:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p+ZnVVzUOhh3; Thu, 14 May 2020 12:30:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6B81722E3F;
	Thu, 14 May 2020 12:30:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60CF0C016F;
	Thu, 14 May 2020 12:30:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C4AFC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EFC7087A50
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UNmgBEl4G9eZ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:30:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4210887A62
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:30:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e16so3810797wra.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=J2ZtatzqD3OE8VdsdW4HBUMkQqixlxQVBQrLMq5CUUY=;
 b=cna/1t9SJDeWhOllSyrFsbKx0FpSu+qU5vcjm9dCmgeETaVbC4scdE9YaQZa7xAhkr
 jHrdBmIyDJ83s6hG2UqR5xnjB9KlJDeexh3TNwXFT20K9xALDBUx8a5xF63UB4ckWqdz
 rmeI0Urauv7XBVMJ/YekgTPyJ+K5u+QxcAMms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=J2ZtatzqD3OE8VdsdW4HBUMkQqixlxQVBQrLMq5CUUY=;
 b=Y6ajlaK2MuMvzJ148v1jhrK0WRMv4fabFbRS1sTt1fBU4LkWShkjD6sPGmE/ufnfwB
 ddIOTA+1ZAHHbCCXn9/ymBR1t4aHwIzyrx3j/sXXK9/uyT1TD8lAktNceZFRk1P5YLFB
 7Lh6O+rcgc77TRCpMVmfAkaISZmDHTn1z4zs/omak/9CspuPbgviIw78/59tZuGmt9y0
 C9fi1VQ6OuEL/2fepomtoXlusf8aXx4gtBriT4UVUYrsO5jSKtimodj3d1tAmYQ2TlvZ
 /ZFWQlKtM5LxYOO2cILl0y/io4HNfTgmAEEjIHflr6N+PavBEOsHNj5oRldAybHpkmLA
 8PLw==
X-Gm-Message-State: AOAM532DCFR+Q5ZsvShgLUk1WWXw7tTegM/Du5znsBj4iSOv4bRYwzsm
 gk8Nw4sWTJMFMi2MeYBEEi/DWw==
X-Google-Smtp-Source: ABdhPJxzzUZ9N249No4GSzh95gQlAWDkP3vcLToZAWmJAuT2AF/3WaSYIEjZHpBOhUMq5YlyAgExqA==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr5203956wru.62.1589459410673;
 Thu, 14 May 2020 05:30:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm4269731wmg.38.2020.05.14.05.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:30:09 -0700 (PDT)
Date: Thu, 14 May 2020 14:30:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514123007.GP206103@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

On Thu, May 14, 2020 at 05:19:40PM +0900, David Stevens wrote:
> Sorry for the duplicate reply, didn't notice this until now.
> 
> > Just storing
> > the uuid should be doable (assuming this doesn't change during the
> > lifetime of the buffer), so no need for a callback.
> 
> Directly storing the uuid doesn't work that well because of
> synchronization issues. The uuid needs to be shared between multiple
> virtio devices with independent command streams, so to prevent races
> between importing and exporting, the exporting driver can't share the
> uuid with other drivers until it knows that the device has finished
> registering the uuid. That requires a round trip to and then back from
> the device. Using a callback allows the latency from that round trip
> registration to be hidden.

Uh, that means you actually do something and there's locking involved.
Makes stuff more complicated, invariant attributes are a lot easier
generally. Registering that uuid just always doesn't work, and blocking
when you're exporting?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
