Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD341B9FB1
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 11:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77C5286292;
	Mon, 27 Apr 2020 09:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJWiBGDK1BhG; Mon, 27 Apr 2020 09:20:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 63F7586252;
	Mon, 27 Apr 2020 09:20:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 320E6C0172;
	Mon, 27 Apr 2020 09:20:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CE17C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 09:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 659F786252
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 09:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ORcHFJCdUmY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 09:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A611F86235
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587979224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/iT1ZSnr3VWE3x+uDoNEdTmOq69Ly4M18udfvhiGRxU=;
 b=fU2qFLIVjumrmw7xos7/exRxGz6GpCU0ZvGkVjJwXqcaEtPB+jxXhVpLvVSFqvINqgBCP4
 jfDRuMLRbDmYmtGbVPpdsJ4hky26X0eRdiA67fTCABEI+EnEIB+dxQdm/+c/edNrxfi/L+
 AB/L7i/kqDXI6mA/SfglVFi/SBL3EXE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-xVVp7uNUMIurdOccMx36JA-1; Mon, 27 Apr 2020 05:20:22 -0400
X-MC-Unique: xVVp7uNUMIurdOccMx36JA-1
Received: by mail-wr1-f71.google.com with SMTP id y10so10191638wrn.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 02:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/iT1ZSnr3VWE3x+uDoNEdTmOq69Ly4M18udfvhiGRxU=;
 b=acMgQQ2Ci35AYhFtOAuPIicqyiDEdn6UA4Z6DD+7xlrG2U5O3Xg5tRNES4LOH8GZLG
 YSmv6GWcG9fzTALe5kNZ89w+psrRN7ny+G4JcyUCE+VLedylqVPDj61rR8bDggUB1Eua
 o3kPy0XHg5GtFgdrCcDMB7GElzqS94RugKwWgYxnh+DlsqLjdD2tsha3C2m6ZVwHPyFi
 ewlVuG764rv6l17pgFk+j0YVegYk06L1x35Jep5n1Jir7oAGrwo7aTPA8XuWIIZfKJJ9
 nP5rdnagj7/ssBMopMQFFXoF6IN3tIHVxQEdIq2AkTitk5TUXmtzeCLZ4mrdN/SE6dOj
 pvSw==
X-Gm-Message-State: AGi0PuZKgHPjvhfFjA4sZvwNb2Kxp5pj8/ZEOxa4eMj+DxgjdESSnYqD
 6dD9aIJc70FsbF3UmrTlLhdfKEXq0xwp+rlNNPGTVZc1gfAk6cYaFoh1WgyCBbvha87EHfJ82ss
 xefBKnnipgwwBQmJFUGtdug4u59HIMfdi2bJ/N9v7JQ==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr26867134wmi.52.1587979221556; 
 Mon, 27 Apr 2020 02:20:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypJLxRMCB8YEXW9YDI2OLkrBugUH83i4IlZL7wCtXLgz+NY/798+oztf6oqjhyKDB3I0p2eFUw==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr26867111wmi.52.1587979221336; 
 Mon, 27 Apr 2020 02:20:21 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 j13sm20977689wrq.24.2020.04.27.02.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 02:20:20 -0700 (PDT)
Date: Mon, 27 Apr 2020 05:20:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] vhost: disable for OABI
Message-ID: <20200427051918-mutt-send-email-mst@kernel.org>
References: <20200420143229.245488-1-mst@redhat.com>
 <CAMuHMdWaG5EUsbTOMPkj4i50D40T0TLRvB6g-Y8Dj4C0v7KTqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWaG5EUsbTOMPkj4i50D40T0TLRvB6g-Y8Dj4C0v7KTqQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, KVM list <kvm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Christoph Hellwig <hch@infradead.org>, netdev <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>
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

On Mon, Apr 27, 2020 at 08:45:22AM +0200, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> Thanks for your patch!
> 
> On Mon, Apr 20, 2020 at 5:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > vhost is currently broken on the some ARM configs.
> >
> > The reason is that the ring element addresses are passed between
> > components with different alignments assumptions. Thus, if
> > guest selects a pointer and host then gets and dereferences
> > it, then alignment assumed by the host's compiler might be
> > greater than the actual alignment of the pointer.
> > compiler on the host from assuming pointer is aligned.
> >
> > This actually triggers on ARM with -mabi=apcs-gnu - which is a
> > deprecated configuration. With this OABI, compiler assumes that
> > all structures are 4 byte aligned - which is stronger than
> > virtio guarantees for available and used rings, which are
> > merely 2 bytes. Thus a guest without -mabi=apcs-gnu running
> > on top of host with -mabi=apcs-gnu will be broken.
> >
> > The correct fix is to force alignment of structures - however
> > that is an intrusive fix that's best deferred until the next release.
> >
> > We didn't previously support such ancient systems at all - this surfaced
> > after vdpa support prompted removing dependency of vhost on
> > VIRTULIZATION. So for now, let's just add something along the lines of
> >
> >         depends on !ARM || AEABI
> >
> > to the virtio Kconfig declaration, and add a comment that it has to do
> > with struct member alignment.
> >
> > Note: we can't make VHOST and VHOST_RING themselves have
> > a dependency since these are selected. Add a new symbol for that.
> 
> Adding the dependencies to VHOST and VHOST_RING themselves is indeed not
> sufficient.  But IMHO you should still add VHOST_DPN dependencies t
>  these two symbols, so any driver selecting them without fulfilling the
> VHOST_DPN dependency will trigger a Kconfig warning.  Else the
> issue will be ignored silently.

Good point.
For now I'm trying to just get rid of this work around.
If I can't I will add the suggested change.
Thanks!

> > We should be able to drop this dependency down the road.
> >
> > Fixes: 20c384f1ea1a0bc7 ("vhost: refine vhost and vringh kconfig")
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Suggested-by: Richard Earnshaw <Richard.Earnshaw@arm.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
