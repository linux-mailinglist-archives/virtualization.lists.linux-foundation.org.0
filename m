Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A59029F081
	for <lists.virtualization@lfdr.de>; Tue, 27 Aug 2019 18:42:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0278B192C;
	Tue, 27 Aug 2019 16:42:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 165DF18EB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 16:42:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7576842D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 16:42:22 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z3so47890245iog.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t4/d9H3zPkehGO8WMS+e05TTbEwolWCKrpo3GXlSVME=;
	b=E3nYAYtY8RBL7TmxP9S3fiLiAcsYg7WuNXOm+m9k8DduShri7h2su9ajoHi6oUGylN
	VZIfblgWGCzQwUbLfLOAbAZ4WRgIKwjB8AwkAPXJjXnj4SmfatFc0doTITMXScMYrK3s
	GyObWXB0qMDySutmj+YtBFWw27p9DjDkKoc7Z18/owXeKbazPgV0WP9DyUiJTp9pbWfW
	J7hGi47WdgAmeXKYkaMX0TOMT9VnJxUvsxgSnCJIJayVgzulry+kv4gNdCLD8k5FQ66O
	g2lcR7zSBGJc9xwMA2txLnLfLWLXIgZv3D4x6kPkxEFxuOwpNzUUQ8Ju687Z7TVcMUE9
	ZGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t4/d9H3zPkehGO8WMS+e05TTbEwolWCKrpo3GXlSVME=;
	b=fikW8dqluZfX6d8qvIyi+L1cQBV09yOaEbURzYcHIh6hwX2y+klAF23ptA3Y+bwhLt
	YnVhrNTt7LVrGYd04/7005bIcJ9jHVbjGNyaqqKNOZMhLy3YLWFzRhHMGQ9NtZF5WYaW
	3U2hKg0xqxdtZPlnKXOH4Jg3dc6xHNQB+rSjt9jwO0aDj+6XDEYhi01t2w6pjiGVfcFx
	US353VRSOS89FPAOBzlhzv4mHah2aGQV6HaGDmTKtD0OpU7QbLD3v6DUmR3bJfH/FZsx
	6/idC0RAb/E3L/5tGev4Y6yArDAEUcW0Rv0OR0TSypZcmvRrDd0nN8SOK9QylOcuD5y6
	9vYw==
X-Gm-Message-State: APjAAAX2PajVPI2BdkBXnFAl60ETcV/MtrThxUmmA0YIEq23215IcPBe
	jJHYQd9NjNWdI3dye4tkFbY9hFh4SBnv8PgcYMk=
X-Google-Smtp-Source: APXvYqyi2cOM6Eact6tIpG5HHBBQxrZq1Jezmt2L9lMrVOzSsV6IBQEOwioAbt80b/i/IBxMdWxMaXHUhAJQ4n/kxBg=
X-Received: by 2002:a6b:720e:: with SMTP id n14mr28333793ioc.139.1566924141570;
	Tue, 27 Aug 2019 09:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190822094657.27483-1-kraxel@redhat.com>
	<CAPaKu7S_He9RYsxDi0Qco4u=Xnc3FjB5nvFT_Zh+o7pvFzCvRQ@mail.gmail.com>
	<20190827052154.etk4jbx45hsrl7z5@sirius.home.kraxel.org>
In-Reply-To: <20190827052154.etk4jbx45hsrl7z5@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 27 Aug 2019 09:42:10 -0700
Message-ID: <CAPaKu7TrPvsiy2EyC4a_tOyi7oAV-Npk+2fqkZwNUfjwNE3AeA@mail.gmail.com>
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

On Mon, Aug 26, 2019 at 10:21 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Aug 26, 2019 at 03:34:56PM -0700, Chia-I Wu wrote:
> > On Thu, Aug 22, 2019 at 2:47 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Use drm_atomic_helper_check_plane_state()
> > > to sanity check the plane state.
> > >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >  drivers/gpu/drm/virtio/virtgpu_plane.c | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> > > index a492ac3f4a7e..fe5efb2de90d 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> > > @@ -84,7 +84,22 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
> > >  static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
> > >                                          struct drm_plane_state *state)
> > >  {
> > > -       return 0;
> > > +       bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
> > > +       struct drm_crtc_state *crtc_state;
> > > +       int ret;
> > > +
> > > +       if (!state->fb || !state->crtc)
> > > +               return 0;
> > > +
> > > +       crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> > > +       if (IS_ERR(crtc_state))
> > > +                return PTR_ERR(crtc_state);
> > Is drm_atomic_get_new_crtc_state better here?
>
> We don't have to worry about old/new state here.  The drm_plane_state we
> get passed is the state we should check in this callback (and I think
> this always is the new state).
Acked-by: Chia-I Wu <olvaffe@gmail.com> (because I am not familiar
with the atomic code to give an r-b)

>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
