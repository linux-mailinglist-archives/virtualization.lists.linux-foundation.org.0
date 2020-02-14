Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E415D8FF
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 15:06:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43C9E86448;
	Fri, 14 Feb 2020 14:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EyCUCeYZQdC2; Fri, 14 Feb 2020 14:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC54886135;
	Fri, 14 Feb 2020 14:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80649C08A4;
	Fri, 14 Feb 2020 14:06:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF6CFC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 14:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D943386ED5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 14:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftj7e1GymcPH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 14:06:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD83886E9E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 14:06:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so11042676wru.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 06:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4/DviMTLAqxW+NTVLow2DllCrC7LZyuIIAbFynwyDuk=;
 b=kqjzPFfTWHUwtTl001+doLTojaPz7S1EdD8xYWxV65vw1JUN9OJ3bxrX7WuYKAYXeW
 RiuqJLP8wmCPAdLFW2tufzNKGTh28foOuPKmWifW+iAUFH6eK1cDmgkGYW59KbhuRKvh
 SdthQHW+e4stnMzrikdlVJfj3jWe8lxY/1dYIrz/WrmOhE49a2KDvfwS74b+S99jhAH6
 jDFaltDw38ITDu1uRUA4VG5/jzOUxG5GcrKWaaTjN9vuPIIPMSa/Mj2/eq+6KrDEP9P6
 K8WiUcLqr9Qm12jRnUWvkF0vbJjdM3lfMG0QTyg87NjKuEajSgBpwIPZdMLFpvpsyrMQ
 jSXA==
X-Gm-Message-State: APjAAAXlg/9O87NtB1TsvvHQqsNYLORUQYauGi9fK3UGAJ6RwCzYctPT
 ciQ92wDF/qKP7n+fzn2AGAKbgjnq
X-Google-Smtp-Source: APXvYqwqAYkIzT1DaMbqwJUULUwsZd6efBR4EsJ+5TXnBVtDKLC5Wnyppu4eiSOPMu38VVysNStKhA==
X-Received: by 2002:adf:fa43:: with SMTP id y3mr4204102wrr.65.1581689203326;
 Fri, 14 Feb 2020 06:06:43 -0800 (PST)
Received: from localhost (ip-37-188-133-87.eurotel.cz. [37.188.133.87])
 by smtp.gmail.com with ESMTPSA id q14sm7263208wrj.81.2020.02.14.06.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 06:06:42 -0800 (PST)
Date: Fri, 14 Feb 2020 15:06:41 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200214140641.GB31689@dhcp22.suse.cz>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205163402.42627-4-david@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>
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

On Wed 05-02-20 17:34:02, David Hildenbrand wrote:
> Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> changed the behavior when deflation happens automatically. Instead of
> deflating when called by the OOM handler, the shrinker is used.
> 
> However, the balloon is not simply some slab cache that should be
> shrunk when under memory pressure. The shrinker does not have a concept of
> priorities, so this behavior cannot be configured.

Adding a priority to the shrinker doesn't sound like a big problem to
me. Shrinkers already get shrink_control data structure already and
priority could be added there.

> There was a report that this results in undesired side effects when
> inflating the balloon to shrink the page cache. [1]
> 	"When inflating the balloon against page cache (i.e. no free memory
> 	 remains) vmscan.c will both shrink page cache, but also invoke the
> 	 shrinkers -- including the balloon's shrinker. So the balloon
> 	 driver allocates memory which requires reclaim, vmscan gets this
> 	 memory by shrinking the balloon, and then the driver adds the
> 	 memory back to the balloon. Basically a busy no-op."
> 
> The name "deflate on OOM" makes it pretty clear when deflation should
> happen - after other approaches to reclaim memory failed, not while
> reclaiming. This allows to minimize the footprint of a guest - memory
> will only be taken out of the balloon when really needed.
> 
> Especially, a drop_slab() will result in the whole balloon getting
> deflated - undesired.

Could you explain why some more? drop_caches shouldn't be really used in
any production workloads and if somebody really wants all the cache to
be dropped then why is balloon any different?

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
