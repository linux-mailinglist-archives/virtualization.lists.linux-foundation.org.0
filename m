Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A00E521AF0C
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 07:58:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E15889593;
	Fri, 10 Jul 2020 05:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcjCiD-zM77X; Fri, 10 Jul 2020 05:58:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3312894EA;
	Fri, 10 Jul 2020 05:58:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77D0DC016F;
	Fri, 10 Jul 2020 05:58:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9D1FC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 05:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E5A23882DC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 05:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lETpaMVuoCvL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 05:58:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 35E9988263
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594360708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4LnrvqT9+DNx24YkEZw2+SXe1o6FKiLlzwpTypzG8A=;
 b=Y+XxOvBjEbl9F7XdtOTWEY97JVlA/4JP9m1OmOM/D/jNmDESGG8eUGLrkYTpi8iDjHO65f
 DcJzt/9EtJvnxVr49HXpyCfTyPviqACGraWwl9LAp+nvbzYOwfs3ZJ/2BEaJ1Ey//5I0mk
 Ry4yH4AO8/XNtQnB4TbTvmqSHnhav1M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-AQfRUacfOsuPmNy59nl9og-1; Fri, 10 Jul 2020 01:58:27 -0400
X-MC-Unique: AQfRUacfOsuPmNy59nl9og-1
Received: by mail-wr1-f69.google.com with SMTP id d11so4670177wrw.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 22:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C4LnrvqT9+DNx24YkEZw2+SXe1o6FKiLlzwpTypzG8A=;
 b=DY1oMXopkj+v1PbOG4QWfZfsCJ8YSTrwRrAnNHuvpvhJy85NKkoDnZaOfjGa2KdFR1
 8vILCAPXQk0YZRGdJFTufG48h7EOiZGYIRhWiMlWht+WgQU0MBWJGxCeAupYgneXlx0W
 pJoq7Q0u/538pVZY14tlrBxW4EhC+106UEhggkmAZlIcoC8oC2fiwxkBJCfrfQepWh25
 zJ2u3I53p/o+lHseqmhUQn+08bFCVPAhPoqf43N7758Pl0b5G4UKBJ0cx91JkOTiP88t
 Tm8Lk7or/vu8Qs9tQqDl6IBAv1UXb+XlK8ipf2h+pji1wVdOSZ6PgkBeB5mvSfI/oQaQ
 e7Cg==
X-Gm-Message-State: AOAM530J5vzQY4qqaOjKVgGhOJkowfEt9z+iMaz54GIg3VUkETGEsWih
 4vdxKnkb6BmYLB1cfBLeoFZcZyBSI9/sNdpbtBoNvZs3k8a/4dMjKcH6K+fTp8kAerr92MbHD1z
 mZstDQ6b9YV6zQPeW7hjbM3+B0uCVnRx7IY00c18bsw==
X-Received: by 2002:a7b:c38f:: with SMTP id s15mr3394775wmj.152.1594360705634; 
 Thu, 09 Jul 2020 22:58:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLn6mDVLNvrd8u4soiaqjHIlkFvr4sTxn75hYjrWzq/00SA7DFxiythkthHZ5njp79o9gOug==
X-Received: by 2002:a7b:c38f:: with SMTP id s15mr3394766wmj.152.1594360705488; 
 Thu, 09 Jul 2020 22:58:25 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 j15sm8366155wrx.69.2020.07.09.22.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:58:24 -0700 (PDT)
Date: Fri, 10 Jul 2020 01:58:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200710015615-mutt-send-email-mst@kernel.org>
References: <20200622122546-mutt-send-email-mst@kernel.org>
 <CAJaqyWfbouY4kEXkc6sYsbdCAEk0UNsS5xjqEdHTD7bcTn40Ow@mail.gmail.com>
 <CAJaqyWefMHPguj8ZGCuccTn0uyKxF9ZTEi2ASLtDSjGNb1Vwsg@mail.gmail.com>
 <419cc689-adae-7ba4-fe22-577b3986688c@redhat.com>
 <CAJaqyWedEg9TBkH1MxGP1AecYHD-e-=ugJ6XUN+CWb=rQGf49g@mail.gmail.com>
 <0a83aa03-8e3c-1271-82f5-4c07931edea3@redhat.com>
 <CAJaqyWeqF-KjFnXDWXJ2M3Hw3eQeCEE2-7p1KMLmMetMTm22DQ@mail.gmail.com>
 <20200709133438-mutt-send-email-mst@kernel.org>
 <7dec8cc2-152c-83f4-aa45-8ef9c6aca56d@redhat.com>
 <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdLOH2EceTUduKYXCQUUNo1XQ1tLgjYHTBGhtdhBPHn_Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm list <kvm@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Fri, Jul 10, 2020 at 07:39:26AM +0200, Eugenio Perez Martin wrote:
> > > How about playing with the batch size? Make it a mod parameter instead
> > > of the hard coded 64, and measure for all values 1 to 64 ...
> >
> >
> > Right, according to the test result, 64 seems to be too aggressive in
> > the case of TX.
> >
> 
> Got it, thanks both!

In particular I wonder whether with batch size 1
we get same performance as without batching
(would indicate 64 is too aggressive)
or not (would indicate one of the code changes
affects performance in an unexpected way).

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
