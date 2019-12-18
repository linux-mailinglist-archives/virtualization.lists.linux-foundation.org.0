Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0AA123ED4
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 06:20:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 393B086AE6;
	Wed, 18 Dec 2019 05:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWP2D7BlV5x4; Wed, 18 Dec 2019 05:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CCF7986AE3;
	Wed, 18 Dec 2019 05:20:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADA64C077D;
	Wed, 18 Dec 2019 05:20:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1D8FC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD8B586C53
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fu8bdpDMuF25
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:20:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4A811878E5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576646406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3o4o36ou2fgtcNIxL+0l8r8a4SDbrFWd0FJcpb/8u5U=;
 b=e9nf1ghj8sHVBznlK54Z3VQDU7IbnOkmzoFKf+8no/2zMxuBs+18dh0oeQ+bcnKCUYpP8n
 1w3IOU+ddCeyosZVx+RXEIUv2GNVQjeSGxmYyUFh/2hMw7Em+IAGNzD3+HBbbQ6N1q+t8Z
 j14AiMJG6W/dUVDn4mc+a4frcCD6gaM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145--7M1E33KPOucue-ALKrH5Q-1; Wed, 18 Dec 2019 00:20:02 -0500
Received: by mail-qt1-f200.google.com with SMTP id i3so695762qtb.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 21:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3o4o36ou2fgtcNIxL+0l8r8a4SDbrFWd0FJcpb/8u5U=;
 b=j/dKpAN1s8OocCeOz5k8GOacUZi3gDMB8bBy4WEYXQLFH9K//a1yanK6JtpICQKXM2
 aXQOk8HMe+VZaE/PP0yO69Unb6+34SFb3h65cnBWTQrSFfdqwVRlCm4LePhuoPI+7zkC
 YOZWv8/wneJdnhbBK7DKC5DEJiVRUYKt8cD1mgjuvXpPoC1Hrd/heUVq878Qe283frnC
 vZ7iJZystStEEwqAHwEkKKrD66CVjUuarnvlmS/ggtXufcHUl49Zed1NE+ewsD//hrw4
 F+0ZF08IMwWuzTMQYr2jkTEfx3HvfnW5WUkmtZrsA/vSl+R/eBeF5swNoxv+OQaOLg21
 DKaw==
X-Gm-Message-State: APjAAAVrrNoE6WmxQGEbOJgqdsxUgMoMBWSNJrie+xWdDxQQYef8aXnX
 0o6L5LrjS8OYqeAp9h0GQ6VbnD5+TV1BYYEvdmZGiPaoB1AO2966TqTilusElgI85vstIffFJ+n
 uKVvA6m8XGsydxJfJ0p38doRYi9OebWEzjA54WO+1jw==
X-Received: by 2002:ac8:2628:: with SMTP id u37mr643780qtu.81.1576646402222;
 Tue, 17 Dec 2019 21:20:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxV0r4CwHZnL32aFOwghSrnRFSh2x9igKwJBWeVijPTC/CKPFzRD8sr/H2mDkLr6vGmlusehw==
X-Received: by 2002:ac8:2628:: with SMTP id u37mr643774qtu.81.1576646402057;
 Tue, 17 Dec 2019 21:20:02 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id e21sm325494qkm.55.2019.12.17.21.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 21:20:01 -0800 (PST)
Date: Wed, 18 Dec 2019 00:19:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH 1/2] virtio-balloon: initialize all vq callbacks
Message-ID: <20191218001922-mutt-send-email-mst@kernel.org>
References: <20191217190610.248061-1-dverkamp@chromium.org>
 <5DF99A95.8050800@intel.com>
MIME-Version: 1.0
In-Reply-To: <5DF99A95.8050800@intel.com>
X-MC-Unique: -7M1E33KPOucue-ALKrH5Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

On Wed, Dec 18, 2019 at 11:18:45AM +0800, Wei Wang wrote:
> On 12/18/2019 03:06 AM, Daniel Verkamp wrote:
> > Ensure that elements of the array that correspond to unavailable
> > features are set to NULL; previously, they would be left uninitialized.
> > 
> > Since the corresponding names array elements were explicitly set to
> > NULL, the uninitialized callback pointers would not actually be
> > dereferenced; however, the uninitialized callbacks elements would still
> > be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
> > vectors required.
> 
> With your 2nd patch:
> if (names[i] && callbacks[i])
>     ++nvectors;
> 
> It seems this patch isn't necessary as names[i] is already NULL, isn't it?
> 
> Best,
> Wei

Right but passing uninitialized values isn't nice even if
the function called happens to ignore them.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
