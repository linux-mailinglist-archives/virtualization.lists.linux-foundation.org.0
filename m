Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AD358152871
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 10:35:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6839881F4D;
	Wed,  5 Feb 2020 09:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqeRvMYxXZ-E; Wed,  5 Feb 2020 09:35:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD6D286233;
	Wed,  5 Feb 2020 09:35:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1BD0C0174;
	Wed,  5 Feb 2020 09:35:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5D46C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C268586C03
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwAm8LagRan4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:35:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD5A586A2E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580895335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MqEFNgg7VYElHgtk2ZTi+JKO+vEk3haTWlqj2aheBQ=;
 b=fSIxzlB61qBbwIGai8X2+V7u17ljf4sKFZuhtpG7owe7bd2YVhbQy3Z2JSneEWrURJvVkU
 ojeuGarYBGs7GCfDW5JXDHR6S1o+rVtu18j3fUmbI4O2GDQKLxfVpVFECwZ6G9zi3z7+Kj
 KLubcETKcsCDA0JhSxh+xfpXMWWreFo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-h9266LMjMqCLpmndQaMfLQ-1; Wed, 05 Feb 2020 04:35:34 -0500
Received: by mail-qk1-f197.google.com with SMTP id 12so865560qkf.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 01:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MqEFNgg7VYElHgtk2ZTi+JKO+vEk3haTWlqj2aheBQ=;
 b=lZprTHeba3S11Sd78lSnGcwMo46nTchpTH5cRiZouQSk7AdxTgEf+MG9FBqQizO+rD
 vmMGdFWPTnpXquu6baSSTIeLf+XSMDN0qsPJ6VyobBz+RK5fnSCjK5SWuYCpps5fZLaG
 dITUopgNk5htrkdYpn5lULWjqQqXKEKIAlqpvTNZzErY1r4iZoMt4cG6lmwY63FbebCr
 0r/j/Vp9Sl3kDg1hUwxqzc32zjM/VCHzeZ5EgCeeKXDgJ8fXoLwt0xk6fkSBS2LI2YpW
 O3lkrV2DytQEBLOdh8alWd05/FVc1WGtWcDFF+NINQZexlBmEB44Dh//Yv1DSAPXYWJ9
 NPdQ==
X-Gm-Message-State: APjAAAWwior8Si3QqNFwBn6CPWkuiIVRyV/y66id1383gyz5VVeIG2s/
 vYLY2PfD27d+AzT0f41We2cXZ38OOTmbqGY722yqYMneL8YJGLZ5wTPcaeYVAXuzw41GaGbDngD
 34hjknWonNlnXZi8/zzZ5lMDdcroY81beyLjQzr2ISQ==
X-Received: by 2002:ac8:f02:: with SMTP id e2mr30883805qtk.216.1580895333855; 
 Wed, 05 Feb 2020 01:35:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKVxl/3Ja0GmRL0rmvaS3pQQsmYk9al03PirFusI3TalJVg/D1Y6CTtli+aC6JJuNwZQ2xTw==
X-Received: by 2002:ac8:f02:: with SMTP id e2mr30883786qtk.216.1580895333592; 
 Wed, 05 Feb 2020 01:35:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id p92sm13317863qtd.14.2020.02.05.01.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 01:35:32 -0800 (PST)
Date: Wed, 5 Feb 2020 04:35:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200205042655-mutt-send-email-mst@kernel.org>
References: <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F0F0@shsmsx102.ccr.corp.intel.com>
 <1eff30a0-a38a-cd45-2fc1-80cfd0bf5f04@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F306@shsmsx102.ccr.corp.intel.com>
 <2b388a78-79cd-f99a-6f87-6446dcb4b819@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F367@shsmsx102.ccr.corp.intel.com>
 <605bef3e-373f-f39a-4849-930326564b5b@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F3DE@shsmsx102.ccr.corp.intel.com>
 <bcb69e37-fd84-6397-0ff5-befd99a361dd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bcb69e37-fd84-6397-0ff5-befd99a361dd@redhat.com>
X-MC-Unique: h9266LMjMqCLpmndQaMfLQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
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

On Wed, Feb 05, 2020 at 10:22:34AM +0100, David Hildenbrand wrote:
> >> 1. Guest allocates a page and sends it to the host.
> >> 2. Shrinker gets active and releases that page again.
> >> 3. Some user in the guest allocates and modifies that page. The dirty bit is
> >> set in the hypervisor.
> > 
> > The bit will be set in KVM's bitmap, and will be synced to QEMU's bitmap when the next round starts.
> > 
> >> 4. The host processes the request and clears the bit in the dirty bitmap.
> > 
> > This clears the bit from the QEMU bitmap, and this page will not be sent in this round.
> > 
> >> 5. The guest is stopped and the last set of dirty pages is migrated. The
> >> modified page is not being migrated (because not marked dirty).
> > 
> > When QEMU start the last round, it first syncs the bitmap from KVM, which includes the one set in step 3.
> > Then the modified page gets sent.
> 
> So, if you run a TCG guest and use it with free page reporting, the race
> is possible?

I'd have to look at the implementation but the basic idea is not
kvm specific. The idea is that hypervisor can detect that 3 happened
after 1, by means of creating a copy of the dirty bitmap
when request is sent to the guest.


> So the correctness depends on two dirty bitmaps in the
> hypervisor and how they interact. wow this is fragile.
> 
> Thanks for the info :)

It's pretty fragile, and the annoying part is we do not
actually benefit from this at all since it all only triggers
in the shrinker corner case.

The original idea was that we can send any hint to hypervisor and reuse
the page immediately without waiting for hint to be seen.  That seemed
worth having, as a means to minimize impact of hinting.
Then we dropped that and switched to OOM, and there not having
to wait also seemed like a worthwhile thing.
In the end we switched to shrinker where we can wait
if we like, and many guests never even hit the shrinker so we
have sacrificed robustness for nothing.

If we go back to OOM then at least it's justified ..

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
