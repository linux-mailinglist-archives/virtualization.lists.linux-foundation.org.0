Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A527A3EECC4
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 14:49:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0E0607E2;
	Tue, 17 Aug 2021 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTDm5aTfOdA1; Tue, 17 Aug 2021 12:49:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2675360813;
	Tue, 17 Aug 2021 12:49:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE6A7C000E;
	Tue, 17 Aug 2021 12:49:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFF9FC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF2604017B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqvXD6exxXX7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 088D64017A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629204569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vcCKqyTQplJmhM6jbmzOZVZZmwW62f89g7PD6tqdQoc=;
 b=QI5eFvYe+rrbE8RLMPhDUZdfRw4BBNXB/VlLM+fzD/sRO8osRpHUJwm5SfIKEWxuT9Hza2
 FBHd+ma0ituqvO/6G0sfprDXG3g0G454ntq451sy8YakSqspnpn/j+kAegcUdgrYueWlRQ
 GapAg/82NSp6aKx//no1PQK4palp8gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-lnzeZJRfOcihOzliFUjK4w-1; Tue, 17 Aug 2021 08:49:28 -0400
X-MC-Unique: lnzeZJRfOcihOzliFUjK4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A49B1026200;
 Tue, 17 Aug 2021 12:49:27 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BB4769280;
 Tue, 17 Aug 2021 12:49:23 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7D68F2281A8; Tue, 17 Aug 2021 08:40:38 -0400 (EDT)
Date: Tue, 17 Aug 2021 08:40:38 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v4 0/8] fuse,virtiofs: support per-file DAX
Message-ID: <YRuuRo8jEs5dkfw9@redhat.com>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
 <CAJfpeguw1hMOaxpDmjmijhf=-JEW95aEjxfVo_=D_LyWx8LDgw@mail.gmail.com>
 <YRuCHvhICtTzMK04@work-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRuCHvhICtTzMK04@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>, Miklos Szeredi <miklos@szeredi.hu>,
 virtualization@lists.linux-foundation.org,
 virtio-fs-list <virtio-fs@redhat.com>, linux-fsdevel@vger.kernel.org
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

On Tue, Aug 17, 2021 at 10:32:14AM +0100, Dr. David Alan Gilbert wrote:
> * Miklos Szeredi (miklos@szeredi.hu) wrote:
> > On Tue, 17 Aug 2021 at 04:22, Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> > >
> > > This patchset adds support of per-file DAX for virtiofs, which is
> > > inspired by Ira Weiny's work on ext4[1] and xfs[2].
> > 
> > Can you please explain the background of this change in detail?
> > 
> > Why would an admin want to enable DAX for a particular virtiofs file
> > and not for others?
> 
> Where we're contending on virtiofs dax cache size it makes a lot of
> sense; it's quite expensive for us to map something into the cache
> (especially if we push something else out), so selectively DAXing files
> that are expected to be hot could help reduce cache churn.

In that case probaly we should just make DAX window larger. I assume
that selecting which files to turn DAX on, will itself will not be
a trivial. Not sure what heuristics are being deployed to determine
that. Will like to know more about it.

Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
