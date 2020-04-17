Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE621ADBCB
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 13:02:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A53587A04;
	Fri, 17 Apr 2020 11:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tbhgE1woj061; Fri, 17 Apr 2020 11:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ADBD8880C2;
	Fri, 17 Apr 2020 11:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76C09C1D8D;
	Fri, 17 Apr 2020 11:02:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F9FFC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 11:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3731A87A04
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 11:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eA9Y0HkeE2wV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 11:02:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9D574879C5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587121339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpSUhmGDBvbi0qMoXBAHmm5ZK7GWdgYDvY5Qv3dFByc=;
 b=Lll9ADV4KVVxuBy+ojixDZLhQ2emku/pi8yZDuPa28cVqkHGoOYIUKTIuSUfUe939hn8BG
 axx3XFZZ3XrJxq4mCuTeiC4g2rHwvuD6pbM3f1HjQ/ajxdhwhfrDAmbQlHTv5GYAHqrqCF
 UufVjxLCWmcusXO5aUK7r8mjQokEW/s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Ac17FrF_Mv2uFLGrw4vDvQ-1; Fri, 17 Apr 2020 07:02:17 -0400
X-MC-Unique: Ac17FrF_Mv2uFLGrw4vDvQ-1
Received: by mail-wm1-f70.google.com with SMTP id d134so2461586wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 04:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xpSUhmGDBvbi0qMoXBAHmm5ZK7GWdgYDvY5Qv3dFByc=;
 b=sxX7zOC+a2I/d5pibKZVJSvM738OySgjxpQotzrf+gwwb6vmWexiXlTpFFQGJkgm41
 UYuTTfl5jq/UrdYVOvHrFkIeJccPMIqyogVIxSMtVfgHZQZJ9/O/l201PxdX++dFzKEk
 GTt8kvhBUJmuC1wIWV5pYH2UcxGJbm0BwarILMNpaxfsvMQEYJY80UfwZDYnB/2SRKqn
 3J+b8iOSwz9yIkgiIj/tmX50wMsiMIMBOCNfTh+fEktRnmkBQuV03xOf8WXyQIprRZ9M
 3i5aENd814x+pLyaX0HQVpfxtp1OjAAmKFntoz4JsGq/Ye5T3My+Qvwd9p6r0TKeiBLh
 BE8A==
X-Gm-Message-State: AGi0Pua0tj49joZ8Ym+XlhVV6siOSWaKkrall9frWb1bwlP7JEDlzFE4
 KLRGbAgpTMZkOECpD96dB79d/yqzNVjN0/CccMkKJ7eBqtGNjgVTabzvlfBgIR+9JQYlEE29uiV
 VL8F89qxp3pb375EH9nFfg361RwO2oyD+GwVPDjbifA==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr3212763wrs.282.1587121336853; 
 Fri, 17 Apr 2020 04:02:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypIVahBmB7vOe2zXVJWusrzF3QIg6mHqaLk613VdzLsDFmYdJrJcqN8WgkaLPhktpt5E8ghvvg==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr3212740wrs.282.1587121336685; 
 Fri, 17 Apr 2020 04:02:16 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id s14sm7231452wmh.18.2020.04.17.04.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 04:02:16 -0700 (PDT)
Date: Fri, 17 Apr 2020 07:02:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417070129-mutt-send-email-mst@kernel.org>
References: <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
 <20200417061815-mutt-send-email-mst@kernel.org>
 <34f46dfc-be16-d057-0760-3cb7c1d1288a@redhat.com>
 <20200417062804-mutt-send-email-mst@kernel.org>
 <be245104-c10b-8a91-24d9-d678126a9304@redhat.com>
MIME-Version: 1.0
In-Reply-To: <be245104-c10b-8a91-24d9-d678126a9304@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org,
 Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org
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

On Fri, Apr 17, 2020 at 12:31:14PM +0200, David Hildenbrand wrote:
> On 17.04.20 12:29, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 12:26:24PM +0200, David Hildenbrand wrote:
> >> On 17.04.20 12:19, Michael S. Tsirkin wrote:
> >>> On Fri, Apr 17, 2020 at 12:09:38PM +0200, David Hildenbrand wrote:
> >>>>  > What do you call "hinting ends" though? The fact we put
> >>>>> a page in the VQ is not a guarantee that it's been consumed
> >>>>> by the hypervisor.
> >>>>>
> >>>>
> >>>> I'd say hinting ends once the hypervisor sets FREE_PAGE_REPORT_S_DONE.
> >>>
> >>> Can't find that one anywhere. what did I miss?
> >>
> >> Sorry, the QEMU implementation is confusing. FREE_PAGE_REPORT_S_DONE is
> >> translated to VIRTIO_BALLOON_CMD_ID_DONE
> > 
> > Well VIRTIO_BALLOON_CMD_ID_DONE just means "don't give me any
> > more hints, I finished migration".
> > Guest will stop hinting even without that once it scans all
> > free memory.
> 
> Yeah, that's the end of the whole process where you can be sure the host
> processed all requests definetly.

It's not guaranteed to happen :) Sending an interrupt at the end
of each scan doubles the overhead ...

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
