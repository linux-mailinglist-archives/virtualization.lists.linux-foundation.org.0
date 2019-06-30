Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9FF5B15A
	for <lists.virtualization@lfdr.de>; Sun, 30 Jun 2019 20:48:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 91642D3B;
	Sun, 30 Jun 2019 18:48:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9F07CF3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 18:48:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 45CD6A8
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 18:48:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so23682383ioa.5
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 11:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M3e5wbnegHeRX/hJTHNWrhDPE+mePTed2TBFVD0zzdU=;
	b=tH//MheYyEsn2cxzZcYSNMd+x21QhqkEDOTdsUgDTmN3b9XSew6Pn+SqEv9spR2WhZ
	oaaQdZOwvfuYIbxcPsJYN6PUQ5YtwmgqAweWZGr2Ox7OjAbjQv3Wo55QQP3UgID2jXbk
	dwwWHTEHh988J92DKnx0jDLBSrHt1xGdV9D+7X8wox+1mQoSkxs03p/mzf4SAL2qJMuh
	DMzwRPnR4b/toWdtVkwZWjmc8PdtL75iXOVVT+cGk+FnWAW9BP0oNiHa5SGhpnVHA7jO
	w2IpzFALFSSoV7m7r2nXqYZ+yJBmLMEB/uN0tes/tmRr8ZcRUgaJdLpqoxmZJMhHIDAF
	K0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M3e5wbnegHeRX/hJTHNWrhDPE+mePTed2TBFVD0zzdU=;
	b=ga05tKgBb2wSBJs3Tu/Si6XtSUqF+gl3guTcTdwCR4q2fw/C/aG0rQBXXVmZEN74L7
	EjTlWcLtx77prc3rDR8X1Z4VdasIqErJucyz4yDRXaFK6liTOTx+1jbjy2owbd9NDABy
	doQapO8/jtXIF+KMGtX2uR0rJLJNXDseqR3hiUbOdsMRRatormnSVfokE04XRJqFTeic
	RzpZ+V/t92b7cdj8uzxHW0Ou2iOeE5I6TYC0EUOOK0w5ErYANvwgTYkqAqawcMPIIXKH
	Qps/cBaCpdDSes3uriqyfkLoyaSayUOOlfjzkwwbduQJ7ZkjuZIq1Z3CCP2zOCmz1Osj
	MgsQ==
X-Gm-Message-State: APjAAAUVtExtvxBKYkWP4X0QsFUYbbbZLQhmENLI46fH3iJwc/5relVm
	teTrj0AQWAPxZzNBFlCcxudpgfFFMkJ5eTSJ7gI=
X-Google-Smtp-Source: APXvYqxNLFDvF0Jc8OwVu9LJ+6zdM0k+fYaovAM8wP7F1mMOdc1R0K9E7gAjVdtCsigB5xj68Ba+RU7xru8auhzN0q4=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr14718033iot.200.1561920484443; 
	Sun, 30 Jun 2019 11:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-9-kraxel@redhat.com>
	<CAPaKu7QjuKMJfhTVOzBsUb8cT9cGgesG_-skQeBO8hL8UqcAzw@mail.gmail.com>
	<20190628103412.f2n7ybp3qtxbhdk4@sirius.home.kraxel.org>
In-Reply-To: <20190628103412.f2n7ybp3qtxbhdk4@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 30 Jun 2019 11:47:53 -0700
Message-ID: <CAPaKu7Qvxp1poDoKz5Rft1uG0-7ijtTJQ-sLibvtewdZyVjXug@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Jun 28, 2019 at 3:34 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > @@ -120,9 +120,9 @@ struct virtio_gpu_vbuffer {
> > >
> > >         char *resp_buf;
> > >         int resp_size;
> > > -
> > >         virtio_gpu_resp_cb resp_cb;
> > >
> > > +       struct virtio_gpu_object_array *objs;
> > This can use a comment (e.g., objects referenced by the vbuffer)
>
> IMHO this is obvious ...
>
> > >  void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
> > >                            void *data, uint32_t data_size,
> > > -                          uint32_t ctx_id, struct virtio_gpu_fence *fence);
> > > +                          uint32_t ctx_id, struct virtio_gpu_fence *fence,
> > > +                          struct virtio_gpu_object_array *objs);
> > Can we keep fence, which is updated, as the last parameter?
>
> Fixed.
>
> > > +       if (buflist) {
> > > +               for (i = 0; i < exbuf->num_bo_handles; i++)
> > > +                       reservation_object_add_excl_fence(buflist->objs[i]->resv,
> > > +                                                         &out_fence->f);
> > > +               drm_gem_unlock_reservations(buflist->objs, buflist->nents,
> > > +                                           &ticket);
> > > +       }
> > We used to unlock after virtio_gpu_cmd_submit.
> >
> > I guess, the fence is considered signaled (because its seqno is still
> > 0) until after virtio_gpu_cmd_submit.  We probably don't want other
> > processes to see the semi-initialized fence.
>
> Good point.  Fixed.
>
> > >  out_memdup:
> > >         kfree(buf);
> > >  out_unresv:
> > > -       ttm_eu_backoff_reservation(&ticket, &validate_list);
> > > -out_free:
> > > -       virtio_gpu_unref_list(&validate_list);
> > Keeping out_free to free buflist seems just fine.
>
> We don't need the separate label though ...
>
> > > +       drm_gem_unlock_reservations(buflist->objs, buflist->nents, &ticket);
> > >  out_unused_fd:
> > >         kvfree(bo_handles);
> > > -       kvfree(buflist);
> > > +       if (buflist)
> > > +               virtio_gpu_array_put_free(buflist);
>
> ... and the buflist is released here if needed.
>
> But we need if (buflist) for drm_gem_unlock_reservations too.  Fixed.
>
> > > -
> > > -               list_del(&entry->list);
> > > -               free_vbuf(vgdev, entry);
> > >         }
> > >         wake_up(&vgdev->ctrlq.ack_queue);
> > >
> > >         if (fence_id)
> > >                 virtio_gpu_fence_event_process(vgdev, fence_id);
> > > +
> > > +       list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
> > > +               if (entry->objs)
> > > +                       virtio_gpu_array_put_free(entry->objs);
> > > +               list_del(&entry->list);
> > We are clearing the list.  I guess list_del is not needed.
> > > +               free_vbuf(vgdev, entry);
>
> This just shuffles around the code.  Dropping list_del() is unrelated
> and should be a separate patch.
Fair point.  We now loop the list twice and I was just looking for
chances for micro-optimizations.
>
> Beside that I'm not sure it actually can be dropped.  free_vbuf() will
> not kfree() the vbuf but keep it cached in a freelist instead.
vbuf is created with kmem_cache_zalloc which always zeros the struct.

>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
