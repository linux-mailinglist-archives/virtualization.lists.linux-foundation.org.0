Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3351D56FC
	for <lists.virtualization@lfdr.de>; Fri, 15 May 2020 19:02:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 348592002C;
	Fri, 15 May 2020 17:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZ41f301Be10; Fri, 15 May 2020 17:02:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 082FE22EE7;
	Fri, 15 May 2020 17:02:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D18AFC016F;
	Fri, 15 May 2020 17:02:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560CEC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 17:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3CA8A89A7B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 17:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTy7RL+8aJ4L
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 17:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0F6789A79
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 17:02:29 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f4so3430396iov.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4LxX21aya1njJEsDIx5vBSoEAszEPhjmyf0dgS3yII=;
 b=vXlR6o4Vd/P05FtkRhCbfqUbWGFm2a46wWCbeFdLoQTjQIFEQyppPs4DygwTdU7vZK
 RrMsK/QTy9wuAbrGP/fS3qVDjf/4DjpyfKUv9X54wH7XelslkoTz1/CySRPAYCoaVpxx
 9zlgqPfYCH7PjxMgQcHrItr0SatixS39/XBEmp/6QW3yh+cDoV+Czz8BioI0XcTIIkwR
 unC/seTBu58ga/hbBDptwSjO8yMmWwKEHtjZzx/Hy/99ozVtY3gyDAOf9KYANpf+WqoO
 9EEKXAuZAg6DltXG/jU+VKTLARZ6vbWJiqIJbVvPkYbvZObT+qaPKdzQjA3Nq0BnfL2z
 Fo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4LxX21aya1njJEsDIx5vBSoEAszEPhjmyf0dgS3yII=;
 b=FL7lCEUtIppjo1TAVKff5Pf0GlYZp+P/RS0EBb3TsmScUS6Q+yDBQ3XCZDDsQmL8ct
 K35NBdvD/n8xea5nO0vnyxiRerE77M1yjpFigQXrtxr9P5IcqTfmxrAwW+C3usqjUa6e
 7/Z9m+TnIPE74fA6wUVOaYyS10FhfAYxFgdrmraKBmagQ4L7jvtFoj0nVCmuuPz47K9V
 2ZOjq94zX71c1KYotCj3mDLeGgPq3Yg5t+Gki7FmfcoJjmCgpXiKBpwTunrML5LyaDoF
 ejfI1YLhma87XyLShWj2qE2zqS4Bq6D2e1xdlhl96Z+PVMPCZkcX+TzEK9PFvB2XGdTP
 BCtg==
X-Gm-Message-State: AOAM530g3MKLOoF2dxnWwxr4gd9IcfP+79VkAvJ/HEM71RLhtOa7Ks31
 OGNC55hFLAF0AsvGMOdWcxD8t92JawftSc1VyVo=
X-Google-Smtp-Source: ABdhPJz6QT/ceexKqVQOHTcp+ofUEdUdBFNPzb4t4A8Vqrq4hzrR8dGn1jfbnA4LlHWhnoFdc15+mGMSe6ixwS1sFhA=
X-Received: by 2002:a02:5249:: with SMTP id d70mr4148947jab.121.1589562148942; 
 Fri, 15 May 2020 10:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200508173732.17877.85060.stgit@localhost.localdomain>
In-Reply-To: <20200508173732.17877.85060.stgit@localhost.localdomain>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 15 May 2020 10:02:18 -0700
Message-ID: <CAKgT0Uce78v1tA6=KHuLNx7pTX324rokprNs32dE2UtsxWnXUg@mail.gmail.com>
Subject: Re: [PATCH v2 resubmit] virtio-balloon: Disable free page reporting
 if page poison reporting is not enabled
To: Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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

Just following up. It has been a week since I submitted this. I was
hoping we could get it in for 5.7 since this affects free page
reporting which will be introduced with that kernel release.

Thanks.

- Alex

On Fri, May 8, 2020 at 10:40 AM Alexander Duyck
<alexander.duyck@gmail.com> wrote:
>
> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>
> We should disable free page reporting if page poisoning is enabled but we
> cannot report it via the balloon interface. This way we can avoid the
> possibility of corrupting guest memory. Normally the page poisoning feature
> should always be present when free page reporting is enabled on the
> hypervisor, however this allows us to correctly handle a case of the
> virtio-balloon device being possibly misconfigured.
>
> Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> ---
>
> Changes since v1:
> Originally this patch also modified free page hinting, that has been removed.
> Updated patch title and description.
> Added a comment explaining reasoning for disabling free page reporting.
>
> Resbumitting v2 w/ Ack from David Hildebrand.
>
>  drivers/virtio/virtio_balloon.c |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 51086a5afdd4..1f157d2f4952 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -1107,11 +1107,18 @@ static int virtballoon_restore(struct virtio_device *vdev)
>
>  static int virtballoon_validate(struct virtio_device *vdev)
>  {
> -       /* Tell the host whether we care about poisoned pages. */
> +       /*
> +        * Inform the hypervisor that our pages are poisoned or
> +        * initialized. If we cannot do that then we should disable
> +        * page reporting as it could potentially change the contents
> +        * of our free pages.
> +        */
>         if (!want_init_on_free() &&
>             (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
>              !page_poisoning_enabled()))
>                 __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
> +       else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
> +               __virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
>
>         __virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
>         return 0;
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
