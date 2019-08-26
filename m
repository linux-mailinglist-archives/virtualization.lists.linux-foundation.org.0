Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E09D936
	for <lists.virtualization@lfdr.de>; Tue, 27 Aug 2019 00:35:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F51BF82;
	Mon, 26 Aug 2019 22:35:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E7AF2ED6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 22:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 844798A7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 22:35:08 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q22so41472049iog.4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 15:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TR73dOPLV+Pq/EfAvMPvdl9VXPIGVXlmHtutdowbA8w=;
	b=irvfEg+oBy3K9i5ph445YDh5/r39NmczOzUV8ARAEH39xs2pKuazZRoL8IZJP565KB
	GOc/68k8QyEfdgqvdqmMItaEkV1dgxRCAfUZkNHxZkvl/ct2uS7VhGvFTnW+UWomp5u0
	yQobZ63b6IegbwLLQ8bKDU49irtHmXs5q8J8a79OwT1acMhB+JPQ6dNfEHDzIFXG1jQy
	inTQiWt+m2Dw2FoBr1U3SZ/bVEWatEX7vus22wc8y/7MF8Zt1Y65+OpffB5hHZFXZZJL
	mMNcx/fwG3BubuSFgvditqHsYEXMaFQhPXp1TgX0RhrYG40tLkIrSziEej9egv5J833i
	/EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TR73dOPLV+Pq/EfAvMPvdl9VXPIGVXlmHtutdowbA8w=;
	b=reoXyDeZtL56Qtg/mzcXCzW2n1/AAPsY2tQQYhsadAXytyR7Nnl2riYipWPrI149e7
	mvB71Wx0kRK9VZnVVee5z3j6Pb1PQYb4jts8IlQiv1W4V9hJaU/THADnCaqnE/GTdURe
	QXG1wbpojoZabH5KfTXcW/YAT3gFx5xS9zDqz3zVVZvu6S0S3sZiRFjIpU26vBsYY7Nz
	NFeREOf7q54BFfow2i1HzK0sHmPBXUhAVabaBXVWjJNK/uXn+GfaWvyh+6gLRI3Tuuho
	wuXQ7sC6rX93Q7s8lGF3dI4qYrxuigwBMpeh6erLJfnOgAxZG0Lm6A5bFZTrRHoef7ro
	TmAA==
X-Gm-Message-State: APjAAAV7GrW19BMnlcOGiypj1YsqIx0FwC/l/PeTs0PSZwWdASX6O7pS
	Glf+9SDTi1mKxUW2FtkAHRNnaLhmnS5Nt8vfj58=
X-Google-Smtp-Source: APXvYqxHblq6gKSwiBmBchpFPLh6rchETDLBs9SBgl/hgzpq8F2KDv3i9uyZVGR4IejBJ9fgI7IYrCeXxX5X4YjwbF4=
X-Received: by 2002:a6b:720e:: with SMTP id n14mr22961192ioc.139.1566858907770;
	Mon, 26 Aug 2019 15:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190822094657.27483-1-kraxel@redhat.com>
In-Reply-To: <20190822094657.27483-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 26 Aug 2019 15:34:56 -0700
Message-ID: <CAPaKu7S_He9RYsxDi0Qco4u=Xnc3FjB5nvFT_Zh+o7pvFzCvRQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: add plane check
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

On Thu, Aug 22, 2019 at 2:47 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Use drm_atomic_helper_check_plane_state()
> to sanity check the plane state.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a492ac3f4a7e..fe5efb2de90d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -84,7 +84,22 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>  static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>                                          struct drm_plane_state *state)
>  {
> -       return 0;
> +       bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
> +       struct drm_crtc_state *crtc_state;
> +       int ret;
> +
> +       if (!state->fb || !state->crtc)
> +               return 0;
> +
> +       crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> +       if (IS_ERR(crtc_state))
> +                return PTR_ERR(crtc_state);
Is drm_atomic_get_new_crtc_state better here?

> +
> +       ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> +                                                 DRM_PLANE_HELPER_NO_SCALING,
> +                                                 DRM_PLANE_HELPER_NO_SCALING,
> +                                                 is_cursor, true);
> +       return ret;
>  }
>
>  static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
