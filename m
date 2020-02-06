Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86F1540E3
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 10:09:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 317752045A;
	Thu,  6 Feb 2020 09:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NbaYn41RS82k; Thu,  6 Feb 2020 09:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 722F120335;
	Thu,  6 Feb 2020 09:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57AEEC013E;
	Thu,  6 Feb 2020 09:09:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7080C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CDF192045A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkG4JShbgRlQ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id F1CF920335
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580980187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A1LG9DblC2cTdhxgTIVXCEtFlpZae6akT23NYT3sY/o=;
 b=HGP9YIq3BUytshsjNmcSxRKc3JZnzBoARf/hVwjb9PrpAqmHjUrP/IMIjHImuMXcmaNNgB
 8kpDPfcN46kWSpsRMwpy7XBdlLvEuRKTl9HI47E23jWJvwo3bodeBdtIdzoUSXd6XmpRXp
 r7apmkIFwZTb5PstBo6/ognxc7HZHmg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-J18T0fnVPjuNJiYU4aV5bQ-1; Thu, 06 Feb 2020 04:09:44 -0500
Received: by mail-qt1-f200.google.com with SMTP id g26so3366741qts.16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 01:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A1LG9DblC2cTdhxgTIVXCEtFlpZae6akT23NYT3sY/o=;
 b=I43wpzdygmywKohJgHvXlvxwA5o7I9YefDle9Q4OGxxTOX9j4y0xD6X2tUvZr2f1pB
 hLmWGIKi5+30SRjm0Tk6mckMmcBk4JsbFKHTYHCy4/H/JJoua3NXBZcvSZESjW59ECgg
 6yoFPPgoEEo6pcsyt9IaDeabNYulgLqORSjrezT+RG2DAKjFwspDJhXQjOWgWiEvVs9+
 FRfojYR/qpwZ8dhX4Gp53tcGJY6MKdRhw36uVqqM578mfslIRtplhIlBCvtKOrIvezg2
 LVE0PivTvr2Z1r13TQFIdBLorX1Vc9Dpr1BB+h1YwzgmbHYM7AGvF+qyHjuxAmzjvOEY
 kHmQ==
X-Gm-Message-State: APjAAAWtJLqRr3eLlIsfI+9Vn0LekFiavG0iRFI/vTlarWniZv/pF0o2
 jCIh2sPhQ7x/S+X7J9NzCVi620CoFkOM7o8A8UdZW/uQ2cxPYoqDdJxkDgUcszeCFIp1a1ecGlX
 gCMRMI3Os0RoCbX6HCj/M++J34GBv/RuexU8bP7Fh4Q==
X-Received: by 2002:a05:620a:ced:: with SMTP id
 c13mr1563608qkj.47.1580980183669; 
 Thu, 06 Feb 2020 01:09:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfMTZ5Cg+M33ciqGE043zi3UGdLoIZDBLsziU6lg7yBA1llshc6iEL8HwIf8KHgdth7yTgAA==
X-Received: by 2002:a05:620a:ced:: with SMTP id
 c13mr1563598qkj.47.1580980183446; 
 Thu, 06 Feb 2020 01:09:43 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id y27sm1418057qta.50.2020.02.06.01.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 01:09:42 -0800 (PST)
Date: Thu, 6 Feb 2020 04:09:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200206040927-mutt-send-email-mst@kernel.org>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <20200206013724-mutt-send-email-mst@kernel.org>
 <51955928-5a4b-c922-ee34-6e94b6cdd385@redhat.com>
 <20200206034916-mutt-send-email-mst@kernel.org>
 <a5dc8a7c-7384-5efa-e251-1cd9a240e73a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a5dc8a7c-7384-5efa-e251-1cd9a240e73a@redhat.com>
X-MC-Unique: J18T0fnVPjuNJiYU4aV5bQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Tyler Sanderson <tysand@google.com>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

On Thu, Feb 06, 2020 at 10:05:43AM +0100, David Hildenbrand wrote:
> >> commit bf50e69f63d21091e525185c3ae761412be0ba72
> >> Author: Dave Hansen <dave@linux.vnet.ibm.com>
> >> Date:   Thu Apr 7 10:43:25 2011 -0700
> >>
> >>     virtio balloon: kill tell-host-first logic
> >>
> >>     The virtio balloon driver has a VIRTIO_BALLOON_F_MUST_TELL_HOST
> >>     feature bit.  Whenever the bit is set, the guest kernel must
> >>     always tell the host before we free pages back to the allocator.
> >>     Without this feature, we might free a page (and have another
> >>     user touch it) while the hypervisor is unprepared for it.
> >>
> >>     But, if the bit is _not_ set, we are under no obligation to
> >>     reverse the order; we're under no obligation to do _anything_.
> >>     As of now, qemu-kvm defines the bit, but doesn't set it.
> > 
> > Well this is not what the spec says in the end.
> 
> I didn't check the spec, maybe I should do that :)
> 
> > To continue that commit message:
> > 
> >     This patch makes the "tell host first" logic the only case.  This
> >     should make everybody happy, and reduce the amount of untested or
> >     untestable code in the kernel.
> 
> Yeah, but this comment explains that the current deflate is only in
> place, because it makes the code simpler (to support both cases). Of
> course, doing the deflate might result in performance improvements.
> (e.g., MADV_WILLNEED)
> 
> > 
> > you can try proposing the change to the virtio TC, see what do others
> > think.
> 
> We can just drop the comment from this patch for now. The tell_host host
> not be an issue AFAIKS.

I guess it's a good idea.


> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
