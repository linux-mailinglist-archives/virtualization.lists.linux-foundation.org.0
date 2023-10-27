Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595E7D9ADB
	for <lists.virtualization@lfdr.de>; Fri, 27 Oct 2023 16:10:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE1A844DB;
	Fri, 27 Oct 2023 14:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE1A844DB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KftGWpfL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fssFq15kF2Da; Fri, 27 Oct 2023 14:10:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 378FB844B1;
	Fri, 27 Oct 2023 14:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378FB844B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D126C008C;
	Fri, 27 Oct 2023 14:10:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87126C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 14:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BD6570793
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 14:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BD6570793
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KftGWpfL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSbRRumvsvwV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 14:10:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A5197078D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 14:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A5197078D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698415839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRdYkYxdau6CHgpGFJcrqTFnU1sI1stdpBHA/cH/+NM=;
 b=KftGWpfLq5X1BdoTBEgOoD6fD2MJ1MSxKx9eqzcOb77/g7cmHC79MWqDSet6KabpFxTGJy
 3pMT392XtC8kSchYM2lXWrbWNUUQlBWDliLI4J5d8mkMMO+9Dvvyqt/LV/FBli5sOj+iAP
 ZFSQJsOniZ/ncMM4OeHx/dg6qK9zL70=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-wigGVc7kPwWYCqqJyEie3Q-1; Fri, 27 Oct 2023 10:10:38 -0400
X-MC-Unique: wigGVc7kPwWYCqqJyEie3Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c75886c044so142282466b.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 07:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698415837; x=1699020637;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRdYkYxdau6CHgpGFJcrqTFnU1sI1stdpBHA/cH/+NM=;
 b=eHTBXwCQidzqrTg5LRKH9hQgxTcI+LZwHweyGAzfVM96LmYwJSD1FzlWb26TtNuT5z
 IlTVoMoAnUhIUkRki1se1szr0NcQ0fXD3rHwgVp217byq/E5UDYy7hjIpH/cp65HUqiE
 r4ue6rYexdCIIO+RYNmVFjNnhJHt7/+7aW1I73g5d8+QGVEFvbA0ZaXZre5J3wDf8WDM
 miMpSWVu35tudnE7/FrFvAAcOwhxhS3YgQCR9L1gcIPF66iugffXQ6wwDcueH3cr1+Ay
 QPrkM0SNZKooMNVhcrjhOvHMxQCMQFN+TTnRdIqtVtgHUkMWXxRdeJXdKqJoGsEkFmAJ
 O9sw==
X-Gm-Message-State: AOJu0YxqqMuibU1qPAeijUpMLvFNJ4saqTc6v+gBtujmw5TWqQ53pwTI
 e0K3p5Ni9GXndstjfzwEsuxnlId6/B2NqVQXfAvaVZPxzalUmMkB8aRn4v4Gfq8h0JmYYvx256N
 b3bp+QVvoCnIaKzgaW8Pk8JocqtGpwlyhnd/t7S2GmA==
X-Received: by 2002:a17:907:26c4:b0:9b9:f980:8810 with SMTP id
 bp4-20020a17090726c400b009b9f9808810mr2403301ejc.34.1698415836845; 
 Fri, 27 Oct 2023 07:10:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMqeS/ENQMteZysZriJDyAUYQDfdM2t4FWgavS3j/Huq1sdB1zR86mo2jMEQI9/MoAZHy9gg==
X-Received: by 2002:a17:907:26c4:b0:9b9:f980:8810 with SMTP id
 bp4-20020a17090726c400b009b9f9808810mr2403261ejc.34.1698415836321; 
 Fri, 27 Oct 2023 07:10:36 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:52a8:fc3f:6e84:948f:e841])
 by smtp.gmail.com with ESMTPSA id
 cf17-20020a170906b2d100b00997d7aa59fasm1275905ejb.14.2023.10.27.07.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 07:10:35 -0700 (PDT)
Date: Fri, 27 Oct 2023 10:10:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4] ALSA: virtio: use ack callback
Message-ID: <20231027100703-mutt-send-email-mst@kernel.org>
References: <ZTjkn1YAFz67yfqx@fedora> <87cyx0xvn7.wl-tiwai@suse.de>
 <jmuevryxo2nlqriqbwz6y2ttwzxwajfsnb5vaez2oqu7etkrd3@lu3pgnfushmr>
MIME-Version: 1.0
In-Reply-To: <jmuevryxo2nlqriqbwz6y2ttwzxwajfsnb5vaez2oqu7etkrd3@lu3pgnfushmr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, mripard@redhat.com,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, tiwai@suse.com,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 pbonzini@redhat.com, perex@perex.cz
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

On Fri, Oct 27, 2023 at 12:18:00PM +0200, Stefano Garzarella wrote:
> On Fri, Oct 27, 2023 at 11:27:40AM +0200, Takashi Iwai wrote:
> > On Wed, 25 Oct 2023 11:49:19 +0200,
> > Matias Ezequiel Vara Larsen wrote:
> > > 
> > > This commit uses the ack() callback to determine when a buffer has been
> > > updated, then exposes it to guest.
> > > 
> > > The current mechanism splits a dma buffer into descriptors that are
> > > exposed to the device. This dma buffer is shared with the user
> > > application. When the device consumes a buffer, the driver moves the
> > > request from the used ring to available ring.
> > > 
> > > The driver exposes the buffer to the device without knowing if the
> > > content has been updated from the user. The section 2.8.21.1 of the
> > > virtio spec states that: "The device MAY access the descriptor chains
> > > the driver created and the memory they refer to immediately". If the
> > > device picks up buffers from the available ring just after it is
> > > notified, it happens that the content may be old.
> > > 
> > > When the ack() callback is invoked, the driver exposes only the buffers
> > > that have already been updated, i.e., enqueued in the available ring.
> > > Thus, the device always picks up a buffer that is updated.
> > > 
> > > For capturing, the driver starts by exposing all the available buffers
> > > to device. After device updates the content of a buffer, it enqueues it
> > > in the used ring. It is only after the ack() for capturing is issued
> > > that the driver re-enqueues the buffer in the available ring.
> > > 
> > > Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > 
> > Applied now to for-next branch.
> 
> Cool, thanks for that!
> 
> I just wonder if we should CC stable since we are fixing a virtio
> specification violation.
> 
> @Michael what do you think?
> 
> Thanks,
> Stefano


Acked-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")


The patch is too big for stable - more than 100 lines added. See:
Documentation/process/stable-kernel-rules.rst



-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
