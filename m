Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCAF3CB072
	for <lists.virtualization@lfdr.de>; Fri, 16 Jul 2021 03:33:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921CC83F0D;
	Fri, 16 Jul 2021 01:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlzdsvBCE1Xx; Fri, 16 Jul 2021 01:33:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5FD9C83EF5;
	Fri, 16 Jul 2021 01:33:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF39DC001F;
	Fri, 16 Jul 2021 01:33:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A9D2C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB7783F0D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSlZHlQKRthz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:32:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6731883EF5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 01:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626399177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPGhP6VKv5DekaUsHYhQlzArZpPv2c0XZLeRqI8dw5w=;
 b=IKhqNzl7L1s5v3GxTNSbRUpigRw/OznJTqqfyr3bgDtvMK6DewZATi7RuR6EoK3PMHT07I
 wqGFyrXP0CkhvOqJoNGmDIYV516ZV2LOQFc3Rd1HDXFXFCGnCr6uwKoCzjvUpC6wqlP9kV
 tviNpaXXXGjXGOjxfDh9sG5idpZqXqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467--tkivL6ANOmAgcGpdc6I0g-1; Thu, 15 Jul 2021 21:32:54 -0400
X-MC-Unique: -tkivL6ANOmAgcGpdc6I0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A291818D6A25;
 Fri, 16 Jul 2021 01:32:52 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-72.rdu2.redhat.com [10.10.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BB8960BF1;
 Fri, 16 Jul 2021 01:32:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D059122021C; Thu, 15 Jul 2021 21:32:47 -0400 (EDT)
Date: Thu, 15 Jul 2021 21:32:47 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Subject: Re: [RFC PATCH 3/3] fuse: add per-file DAX flag
Message-ID: <YPDhv0JJHqbMCyXD@redhat.com>
References: <20210715093031.55667-1-jefflexu@linux.alibaba.com>
 <20210715093031.55667-4-jefflexu@linux.alibaba.com>
 <20210716004028.GA30967@rsjd01523.et2sqa>
 <YPDX9S3/TD3CL0CZ@redhat.com>
 <6d956097-47c1-5193-bbaa-faf14f0989ef@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d956097-47c1-5193-bbaa-faf14f0989ef@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Liu Bo <bo.liu@linux.alibaba.com>, stefanha@redhat.com, miklos@szeredi.hu
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

On Fri, Jul 16, 2021 at 09:18:34AM +0800, JeffleXu wrote:
> 
> 
> On 7/16/21 8:51 AM, Vivek Goyal wrote:
> > On Fri, Jul 16, 2021 at 08:40:29AM +0800, Liu Bo wrote:
> >> On Thu, Jul 15, 2021 at 05:30:31PM +0800, Jeffle Xu wrote:
> >>> Add one flag for fuse_attr.flags indicating if DAX shall be enabled for
> >>> this file.
> >>>
> >>> When the per-file DAX flag changes for an *opened* file, the state of
> >>> the file won't be updated until this file is closed and reopened later.
> >>>
> >>> Currently it is not implemented yet to change per-file DAX flag inside
> >>> guest kernel, e.g., by chattr(1).
> >>
> >> Thanks for the patch, it looks good to me.
> >>
> >> I think it's a good starting point, what I'd like to discuss here is
> >> whether we're going to let chattr to toggle the dax flag.
> > 
> > I have the same question. Why not take chattr approach as taken
> > by ext4/xfs as well.
> > 
> > Vivek
> 
> Thanks.
> 
> We can implement the chattr approach as ext4/xfs do, if we have this use
> scenario. It's an RFC patch, and I want to collect more feedback as soon
> as possible.

I guess chattr approach will allow client (as well as server) to control
which files should be DAX. While this approach allows only server to
specify which files should use DAX. Given currently we let client
control whether to use dax or not (-o dax), it probably will make
sense to use chattr based approach?

I will look at the patches. Do you have a corresponding user space
implementation somewhere so that I can test it?

Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
