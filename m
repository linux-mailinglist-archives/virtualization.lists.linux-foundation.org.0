Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C44175ACB
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 13:49:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A4E08147D;
	Mon,  2 Mar 2020 12:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPs5xHpk9dVr; Mon,  2 Mar 2020 12:48:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B352681422;
	Mon,  2 Mar 2020 12:48:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92764C013E;
	Mon,  2 Mar 2020 12:48:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12DE8C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 12:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00EA48536C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 12:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXOwoN-ZwuZ0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 12:48:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 575E48535F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 12:48:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 6so2563700wmi.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s+VyaNhmOd6f42VIDi6KHAKXCWAclUlFckZ+VTZz/lc=;
 b=WQWk74uq0uW7c6N2JxEUPuhvrSjadUOVzH2RBfuXiIQxruG/xG1mdSzbuQGB8MmoH9
 +77T5lyOGQeQTc9L+8QNyZ2SVYCtmnGeNxV1RCotqvidIuIlI3jb8PGjWxhKSOGJEch/
 cqSZPL/Pb/dYuWA7Ye8C8biRegEYAJTFlssXl+reU0vHs/D9HpaIwthun3UzKZj+Zpkg
 3GE7G6BOgdt86ni6X+pC08h6gtdYKPd/a/BMt918u0Gv+IZD5eIG2mLXCj/ZvHk6TOGg
 wvv5kmlRh5Y8JzclIXa6oJvQW/Dw3DzC8VXWXpdEYFOAoSNrhTQzxt8b6Fho/3ck++Oa
 tA6Q==
X-Gm-Message-State: ANhLgQ0gqWUvLq9Bj7WjlCPt4ZDDHkwsy6PH0O4O9RqqB7T788Zv0CbA
 8p2LiBYu8qF1+hQyKwibtqo=
X-Google-Smtp-Source: ADFU+vu2qgToohf1Ho0XOtqDdOYGWkWtP/VPHfRQw8HJnTcjtKh7DPXkwvVpSUhS0/HRLDYCsIxTfA==
X-Received: by 2002:a7b:cc69:: with SMTP id n9mr2851092wmj.175.1583153333837; 
 Mon, 02 Mar 2020 04:48:53 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z14sm28071107wru.31.2020.03.02.04.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:48:53 -0800 (PST)
Date: Mon, 2 Mar 2020 13:48:52 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v4 08/13] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200302124852.GJ4380@dhcp22.suse.cz>
References: <20191212171137.13872-1-david@redhat.com>
 <20191212171137.13872-9-david@redhat.com>
 <20200225141134.GU22443@dhcp22.suse.cz>
 <d1dbb687-7959-f4f1-6a64-33ee039782ef@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1dbb687-7959-f4f1-6a64-33ee039782ef@redhat.com>
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, Dan Williams <dan.j.williams@intel.com>
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

On Tue 25-02-20 15:27:28, David Hildenbrand wrote:
> On 25.02.20 15:11, Michal Hocko wrote:
> > On Thu 12-12-19 18:11:32, David Hildenbrand wrote:
> >> virtio-mem wants to offline and remove a memory block once it unplugged
> >> all subblocks (e.g., using alloc_contig_range()). Let's provide
> >> an interface to do that from a driver. virtio-mem already supports to
> >> offline partially unplugged memory blocks. Offlining a fully unplugged
> >> memory block will not require to migrate any pages. All unplugged
> >> subblocks are PageOffline() and have a reference count of 0 - so
> >> offlining code will simply skip them.
> >>
> >> All we need an interface to trigger the "offlining" and the removing in a
> >> single operation - to make sure the memory block cannot get onlined by
> >> user space again before it gets removed.
> > 
> > Why does that matter? Is it really likely that the userspace would
> > interfere? What would be the scenario?
> 
> I guess it's not that relevant after all (I think this comment dates
> back to the times where we didn't have try_remove_memory() and could
> actually BUG_ON() in remove_memory() if there would have been a race).
> Can drop that part.
> 
> > 
> > Or is still mostly about not requiring callers to open code this general
> > patter?
> 
> From kernel module context, I cannot get access to the actual memory
> block device (find_memory_block()) and call the device_unregister().
> 
> Especially, also the device hotplug lock is not exported. So this is a
> clean helper function to be used from kernel module context. (e.g., also
> hyper-v showed interest for using that)

Fair enough.
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
