Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D81361F5767
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 17:13:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 863EF859E3;
	Wed, 10 Jun 2020 15:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zmhq3lxtExKJ; Wed, 10 Jun 2020 15:13:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 527A0891C1;
	Wed, 10 Jun 2020 15:13:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DDADC016F;
	Wed, 10 Jun 2020 15:13:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2EFDC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DAF3488DDA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LfEhjQn8FWU
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:13:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 453FC859E3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591802026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YfhNq/fazdZ8Eyi5klTe6PYJfVDAk96bmheZ7cnvsnc=;
 b=IWieV6ylmRF+tcqW0QyayQzt9JXCHKDwNZfWK19M+T8gPdkrNj+QS04g7SMVFSzbkgNIxm
 ++yaiBpy7yrjauW+GqWiCyyvjFYSid5nz6grOgabHIs8OR3YnOfIV9D8aDY82kRsTQQjJ4
 /vNc1sp2FeDXbL3bo+L7kbllGBmNmI0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-rh0tnLqJNri0f2Z0ghDkVg-1; Wed, 10 Jun 2020 11:13:44 -0400
X-MC-Unique: rh0tnLqJNri0f2Z0ghDkVg-1
Received: by mail-wr1-f69.google.com with SMTP id s17so1211709wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 08:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YfhNq/fazdZ8Eyi5klTe6PYJfVDAk96bmheZ7cnvsnc=;
 b=Q+rb9aPbZD1wzS1d518rt17P/U5zgSQxjMRlByl80FRKzIbBAJBeTnoI+/9Cc/Ea1M
 jVYowoes/Ci5/cQryvz6TgVcsm7MURc69xoXr8a4N5KDCELU84v5vZ0Cun4+tXcTd+0A
 3RI7tXU2GG18ATmPo5dV26/45DF2kIQlmKpLTwQKd1IeCY0Js3Jg5K6OokboduV6ov/8
 aQrlT2UgPRRDcqbClyUNqB+0MMEOPz3dQZZiR/taan0F6Fb+RtBoRWnbVS5nQouRE1xR
 Ot4hgpTwLbyVi3Sx5rKcPymAGI4nOqe1h8UVLa+JcXosqBZNdY9LAkpwWFx4pz0lW/5+
 S0PA==
X-Gm-Message-State: AOAM533MfJoET82s+mK1f7UIQbH4Zy+vanGqhFeeU0YhnOkqObxCFlSN
 XGHrJzp80RmKkW69HKRL0wIT1uX73Zc2hPfe4nlq/hOF5yzyGwuSrm68NjZazfm5UC6DwLkXO0y
 pEGARyaHt72sTAvAwdiu6oj17442iisdIG6yEvImKLA==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr3730153wmf.69.1591802020718; 
 Wed, 10 Jun 2020 08:13:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww1vH7zy+FsH/SZuuGBRzDcjEXQict36Ept0NkVt1LYqloJMLuBhZhh8r1NCU9jdQ8aYiDHA==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr3730071wmf.69.1591802019527; 
 Wed, 10 Jun 2020 08:13:39 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id m24sm51095wmi.14.2020.06.10.08.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 08:13:38 -0700 (PDT)
Date: Wed, 10 Jun 2020 11:13:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v7 03/14] vhost: use batched get_vq_desc version
Message-ID: <20200610111147-mutt-send-email-mst@kernel.org>
References: <20200610113515.1497099-1-mst@redhat.com>
 <20200610113515.1497099-4-mst@redhat.com>
 <CAJaqyWdGKh5gSTndGuVPyJSgt3jfjfW4xNCrJ2tQ9f+mD8=sMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdGKh5gSTndGuVPyJSgt3jfjfW4xNCrJ2tQ9f+mD8=sMQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm list <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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

On Wed, Jun 10, 2020 at 02:37:50PM +0200, Eugenio Perez Martin wrote:
> > +/* This function returns a value > 0 if a descriptor was found, or 0 if none were found.
> > + * A negative code is returned on error. */
> > +static int fetch_descs(struct vhost_virtqueue *vq)
> > +{
> > +       int ret;
> > +
> > +       if (unlikely(vq->first_desc >= vq->ndescs)) {
> > +               vq->first_desc = 0;
> > +               vq->ndescs = 0;
> > +       }
> > +
> > +       if (vq->ndescs)
> > +               return 1;
> > +
> > +       for (ret = 1;
> > +            ret > 0 && vq->ndescs <= vhost_vq_num_batch_descs(vq);
> > +            ret = fetch_buf(vq))
> > +               ;
> 
> (Expanding comment in V6):
> 
> We get an infinite loop this way:
> * vq->ndescs == 0, so we call fetch_buf() here
> * fetch_buf gets less than vhost_vq_num_batch_descs(vq); descriptors. ret = 1
> * This loop calls again fetch_buf, but vq->ndescs > 0 (and avail_vq ==
> last_avail_vq), so it just return 1

That's what
	 [PATCH RFC v7 08/14] fixup! vhost: use batched get_vq_desc version
is supposed to fix.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
