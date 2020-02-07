Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 102CF15554D
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 11:08:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D5F486B55;
	Fri,  7 Feb 2020 10:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AY9+71y7nJFU; Fri,  7 Feb 2020 10:08:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E4E7854C0;
	Fri,  7 Feb 2020 10:08:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28544C013E;
	Fri,  7 Feb 2020 10:08:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AD43C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 53C7F844A1
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4N5iUN0FbNv
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:08:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9DDC984067
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581070079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hww+G4VML7m0WisANEdJ/P2iFS+sF+6xCl9lSHHOIXI=;
 b=ND2emrhhWdclIrzzkkZ7bQ/od9ewgpblRhGHLi3pbk/92EsZScNfuyW9mIaY81/vgutucW
 b/gR+TcGEoyet2Mynk2bGx0k/Q/9UV+8VEr7bJp4WRiZgt003KxQPl/5gjaNxegdFjsBi/
 ZNb7m9i6Rs4c+3c9nOpHWJsP2ZRVHO8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-bFW93wPVPRia4hKvGlRkqw-1; Fri, 07 Feb 2020 05:07:58 -0500
Received: by mail-qv1-f72.google.com with SMTP id dc2so835274qvb.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 02:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hww+G4VML7m0WisANEdJ/P2iFS+sF+6xCl9lSHHOIXI=;
 b=eX4Dzbde2RXYCJAJtv9P3br5NDQXeVh/7FUz7feLe/1JDMO6oUFtCceil4avTQRtBu
 qAWD6Su0lK3Ltx0OLljaIYOQzh7eOF2iloMrHPFJ+Lv7o3kYozSxlKo9/Ca+qHFOe1l5
 UJWAD2nUfvwaAXosbLACv49vuzdXwPfzpRaXhqKqnaQMxI7zuXS34rgOwamkLnUMkqzO
 lZ/b2lJz1czP1/A6vtyD0zhxdv7B/G+YhOI9yD7yQvSlcObxp16+doFCj3Q7uSKFN0o0
 1gwZlljxlNlUtluSJK0luR6g++3Y/csMcLut1XRR3ICOIgPvp9OUtqqY7RtKVdG3fPEy
 gZig==
X-Gm-Message-State: APjAAAW+SunjXGN2MDUtBO6GC6MTI1995sZ6xiOX6fV32fzCorWTOrCl
 KZLEJV+vZYzwo4+z94P4tYytCa5+kLWJ9jJ4HnknLBpT7Ncs1NCMXjD0XbUtXslJKiJs6Zbv7fA
 h53BByymHmc6ymcjmX4DpFTwCS/SF3SLydl0YKFrfqw==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr6565023qkn.293.1581070076408; 
 Fri, 07 Feb 2020 02:07:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2Tf4Dc3I9vhEU7wQz4PfOE2roZy7Xvp6VWxn/M6XGCbLGhkv3J1M03O/Eb7Fbru/j5RsZlQ==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr6565001qkn.293.1581070076110; 
 Fri, 07 Feb 2020 02:07:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id g6sm1052150qki.100.2020.02.07.02.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 02:07:55 -0800 (PST)
Date: Fri, 7 Feb 2020 05:07:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
Message-ID: <20200207050731-mutt-send-email-mst@kernel.org>
References: <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <20200207095353.08bc91e4.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207095353.08bc91e4.cohuck@redhat.com>
X-MC-Unique: bFW93wPVPRia4hKvGlRkqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 eperezma@redhat.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Fri, Feb 07, 2020 at 09:53:53AM +0100, Cornelia Huck wrote:
> On Fri, 7 Feb 2020 09:13:14 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
> > On 07.02.20 08:58, Michael S. Tsirkin wrote:
> > > On Fri, Feb 07, 2020 at 08:47:14AM +0100, Christian Borntraeger wrote:  
> > >> Also adding Cornelia.
> > >>
> > >>
> > >> On 06.02.20 23:17, Michael S. Tsirkin wrote:  
> > >>> On Thu, Feb 06, 2020 at 04:12:21PM +0100, Christian Borntraeger wrote:  
> > >>>>
> > >>>>
> > >>>> On 06.02.20 15:22, eperezma@redhat.com wrote:  
> > >>>>> Hi Christian.
> > >>>>>
> > >>>>> Could you try this patch on top of ("38ced0208491 vhost: use batched version by default")?
> > >>>>>
> > >>>>> It will not solve your first random crash but it should help with the lost of network connectivity.
> > >>>>>
> > >>>>> Please let me know how does it goes.  
> > >>>>
> > >>>>
> > >>>> 38ced0208491 + this seem to be ok.
> > >>>>
> > >>>> Not sure if you can make out anything of this (and the previous git bisect log)  
> > >>>
> > >>> Yes it does - that this is just bad split-up of patches, and there's
> > >>> still a real bug that caused worse crashes :)
> > >>>
> > >>> So I just pushed batch-v4.
> > >>> I expect that will fail, and bisect to give us
> > >>>     vhost: batching fetches
> > >>> Can you try that please?
> > >>>  
> > >>
> > >> yes.
> > >>
> > >> eccb852f1fe6bede630e2e4f1a121a81e34354ab is the first bad commit
> > >> commit eccb852f1fe6bede630e2e4f1a121a81e34354ab
> > >> Author: Michael S. Tsirkin <mst@redhat.com>
> > >> Date:   Mon Oct 7 06:11:18 2019 -0400
> > >>
> > >>     vhost: batching fetches
> > >>     
> > >>     With this patch applied, new and old code perform identically.
> > >>     
> > >>     Lots of extra optimizations are now possible, e.g.
> > >>     we can fetch multiple heads with copy_from/to_user now.
> > >>     We can get rid of maintaining the log array.  Etc etc.
> > >>     
> > >>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >>
> > >>  drivers/vhost/test.c  |  2 +-
> > >>  drivers/vhost/vhost.c | 39 ++++++++++++++++++++++++++++++++++-----
> > >>  drivers/vhost/vhost.h |  4 +++-
> > >>  3 files changed, 38 insertions(+), 7 deletions(-)
> > >>  
> > > 
> > > 
> > > And the symptom is still the same - random crashes
> > > after a bit of traffic, right?  
> > 
> > random guest crashes after a reboot of the guests. As if vhost would still
> > write into now stale buffers.
> > 
> 
> I'm late to the party; but where is that commit located? Or has it been
> dropped again already?

my vhost tree. Tag batch-v4.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
