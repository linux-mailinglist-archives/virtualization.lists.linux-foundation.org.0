Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 44940180A5A
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 22:25:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D493D87FE8;
	Tue, 10 Mar 2020 21:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHhawEao1SE5; Tue, 10 Mar 2020 21:25:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5111C87FA1;
	Tue, 10 Mar 2020 21:25:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D2E7C0177;
	Tue, 10 Mar 2020 21:25:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96816C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 21:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9297286456
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 21:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZopdvyNTwmC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 21:25:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27E9C86451
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583875536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjppQBeLTkZZCecEWozf+N5VWi5ByBEgDv2ZEv1V9p0=;
 b=LMSz1AQ94bKI4b8N07/Mmqk59GkQyGEBvQDbz8xsdQ0TcttjeK8sIWjH+A9j39JKPljPkD
 Q9BUHYcj1I0uk2LN/Vj2SsF7duagepy/tToSUWRIYnjQM0MxE/CZpoZ1KwysGctdP7q+i0
 Qeuvx6HJ6b7tWC8nRD2rM7uaQXkSYnI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-qJrjghsHMjmPxUp3Ca1DPw-1; Tue, 10 Mar 2020 17:25:33 -0400
X-MC-Unique: qJrjghsHMjmPxUp3Ca1DPw-1
Received: by mail-qv1-f72.google.com with SMTP id s7so1391117qvl.21
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 14:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PjppQBeLTkZZCecEWozf+N5VWi5ByBEgDv2ZEv1V9p0=;
 b=QKvCEkpa79CCMUnXAptnt7t3TD2aRNwf4Sdm0/5XbIhk+m70DRJFk1YDCNZiY0F6nS
 Ha64CbRdgp0XY/jMyNsx6sODPVSkRoLa+twh85DsuLAEAKyY+1+safWn9l4ULLElKO/5
 uvZeGMkgTnWHXWlzZrHda/4XmXMifiqIgs8wFAAVvKM4NoWuIxsgr0LFT7bQKvJ7WXrH
 utbtAiy6j9ybHTOHyB1gEXazzocC9gekxoDSYmDT4C8aqduDt9yQyl+4rjLbxECBKk+6
 K4g8KMkKEAWYnSQQKe9ctHsDH6+Wh5FAxR180q8hQAikDvCqyepcKN/S6dGp947Ny0w+
 tllw==
X-Gm-Message-State: ANhLgQ2pmO3jLYtT5aHqtixfikZK0Nft3ZIQoYr+nqy9tHaTXERTMr4R
 8Go0i7F6sI3TD2R08b9o7My9m0ffJ8FMMCGGN86k7zNaxWj529rySgm7gr0UhNJ4LEfCtZ17b/i
 5Z6LP0e24KdPMAoa9WnoS6Vppn4DYaK88b23NkDJO/A==
X-Received: by 2002:a05:6214:118d:: with SMTP id
 t13mr180509qvv.192.1583875532913; 
 Tue, 10 Mar 2020 14:25:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsm9esHy6RRQ6NWExmJI592vF5/fX7Q0wtldkoyBFRw99jepEJ3weu40LWa8dfzm4aTO5HEjg==
X-Received: by 2002:a05:6214:118d:: with SMTP id
 t13mr180490qvv.192.1583875532728; 
 Tue, 10 Mar 2020 14:25:32 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id n50sm3507706qtc.5.2020.03.10.14.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 14:25:31 -0700 (PDT)
Date: Tue, 10 Mar 2020 17:25:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200310172114-mutt-send-email-mst@kernel.org>
References: <20200310113854.11515-1-david@redhat.com>
 <alpine.DEB.2.21.2003101204590.90377@chino.kir.corp.google.com>
 <890da35b-1ac2-9c2e-b42d-96d24d3e0f4c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <890da35b-1ac2-9c2e-b42d-96d24d3e0f4c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

On Tue, Mar 10, 2020 at 08:13:19PM +0100, David Hildenbrand wrote:
> > Should this have:
> > 
> > Cc: stable@vger.kernel.org # 4.19+
> 
> I guess as nothing will actually "crash" it's not worth stable.


No - it's a regression, it would be a stable candidate from that POV.
The issue is the patch size - stable rules say:

 - It cannot be bigger than 100 lines, with context.

This is about 200 lines with context.
In practice Fixes: is enough to make a bunch of downstreams pick it up.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
