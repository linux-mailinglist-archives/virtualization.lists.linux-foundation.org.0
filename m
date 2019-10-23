Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F32E1EDD
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 17:08:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 91DE0B65;
	Wed, 23 Oct 2019 15:08:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED0F1AD0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 15:08:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 31B7D887
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 15:08:07 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F2468F90F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 15:08:06 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a15so11216085wrr.0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1L6W+k0nNg/tQAHowWr/1ED2GuKCPT//Gnu5zgyCNAI=;
	b=ulZYl0K3Vng/pV2osYKbFgfPlqktOEb0UqUDcGDHzjKGWqjlFo26qZ9Wxv9a/QyudQ
	RIFD42NqIHYS9DysJhq4yKEogD8ngVbz5nFQBTKtksZatmFYLjQ+TsubSI4HSskuxze6
	NN9pTxwD8iF7JyiwqLKMK1gsVYX5TDQ5twEEDvso5DTm7A3Z10wEWQ3Q9Uqwa6IzBuau
	Oq6nITHXGqxbWY6w6JuoWF+/CKVr3dFjVeuJZ32KsbME0YVzrJeFrpCIMg0+xdsVZQ20
	4RiDzOMIFmb0JwRC0GHxighdqH86AhUteGw9kgIPTpA9MtCh6O588g6uZ0R+JNK/9zmb
	FhJw==
X-Gm-Message-State: APjAAAWCBN4DrEHjhRYvOT/v2LsXgNSW0ukuq2jJXglMbxz0IyL6ZKsz
	+sGnTVnT3NYSg51ripAfsaCYEICK02MeS3kJokwhP+rZc2F5n7NKX3CkmDJkTwpgW4VSr70xPO5
	d5tpFsnPWNXJd1s/kIjKuOYQ8MCVV0t3Z/7eZf4jTSQ==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr1459761wrw.176.1571843284753; 
	Wed, 23 Oct 2019 08:08:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1BkWFgjFt13kSOZhC5tHhC1h/h69jYbIAHFEuvb5Y1HTNMeyVSdSK6hLWHxU9/yDmdywCwA==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr1459721wrw.176.1571843284393; 
	Wed, 23 Oct 2019 08:08:04 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	x2sm20845980wrn.81.2019.10.23.08.08.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 08:08:03 -0700 (PDT)
Date: Wed, 23 Oct 2019 17:08:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org, Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 11/14] vsock: add multi-transports support
Message-ID: <CAGxU2F7n48kBy_y2GB=mcvraK=mw_2Jn8=2hvQnEOWqWuT9OjA@mail.gmail.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-12-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023095554.11340-12-sgarzare@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

On Wed, Oct 23, 2019 at 11:59 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> This patch adds the support of multiple transports in the
> VSOCK core.
>
> With the multi-transports support, we can use vsock with nested VMs
> (using also different hypervisors) loading both guest->host and
> host->guest transports at the same time.
>
> Major changes:
> - vsock core module can be loaded regardless of the transports
> - vsock_core_init() and vsock_core_exit() are renamed to
>   vsock_core_register() and vsock_core_unregister()
> - vsock_core_register() has a feature parameter (H2G, G2H, DGRAM)
>   to identify which directions the transport can handle and if it's
>   support DGRAM (only vmci)
> - each stream socket is assigned to a transport when the remote CID
>   is set (during the connect() or when we receive a connection request
>   on a listener socket).
>   The remote CID is used to decide which transport to use:
>   - remote CID > VMADDR_CID_HOST will use host->guest transport
>   - remote CID <= VMADDR_CID_HOST will use guest->host transport
> - listener sockets are not bound to any transports since no transport
>   operations are done on it. In this way we can create a listener
>   socket, also if the transports are not loaded or with VMADDR_CID_ANY
>   to listen on all transports.
> - DGRAM sockets are handled as before, since only the vmci_transport
>   provides this feature.
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> RFC -> v1:
> - documented VSOCK_TRANSPORT_F_* flags
> - fixed vsock_assign_transport() when the socket is already assigned
>   (e.g connection failed)
> - moved features outside of struct vsock_transport, and used as
>   parameter of vsock_core_register()
> ---
>  drivers/vhost/vsock.c                   |   5 +-
>  include/net/af_vsock.h                  |  17 +-
>  net/vmw_vsock/af_vsock.c                | 237 ++++++++++++++++++------
>  net/vmw_vsock/hyperv_transport.c        |  26 ++-
>  net/vmw_vsock/virtio_transport.c        |   7 +-
>  net/vmw_vsock/virtio_transport_common.c |  28 ++-
>  net/vmw_vsock/vmci_transport.c          |  31 +++-
>  7 files changed, 270 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 6d7e4f022748..b235f4bbe8ea 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -831,7 +831,8 @@ static int __init vhost_vsock_init(void)
>  {
>         int ret;
>
> -       ret = vsock_core_init(&vhost_transport.transport);
> +       ret = vsock_core_register(&vhost_transport.transport,
> +                                 VSOCK_TRANSPORT_F_H2G);
>         if (ret < 0)
>                 return ret;
>         return misc_register(&vhost_vsock_misc);
> @@ -840,7 +841,7 @@ static int __init vhost_vsock_init(void)
>  static void __exit vhost_vsock_exit(void)
>  {
>         misc_deregister(&vhost_vsock_misc);
> -       vsock_core_exit();
> +       vsock_core_unregister(&vhost_transport.transport);
>  };
>
>  module_init(vhost_vsock_init);
> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index fa1570dc9f5c..27a3463e4892 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -91,6 +91,14 @@ struct vsock_transport_send_notify_data {
>         u64 data2; /* Transport-defined. */
>  };
>
> +/* Transport features flags */
> +/* Transport provides host->guest communication */
> +#define VSOCK_TRANSPORT_F_H2G          0x00000001
> +/* Transport provides guest->host communication */
> +#define VSOCK_TRANSPORT_F_G2H          0x00000002
> +/* Transport provides DGRAM communication */
> +#define VSOCK_TRANSPORT_F_DGRAM                0x00000004
> +
>  struct vsock_transport {
>         /* Initialize/tear-down socket. */
>         int (*init)(struct vsock_sock *, struct vsock_sock *);
> @@ -154,12 +162,8 @@ struct vsock_transport {
>
>  /**** CORE ****/
>
> -int __vsock_core_init(const struct vsock_transport *t, struct module *owner);
> -static inline int vsock_core_init(const struct vsock_transport *t)
> -{
> -       return __vsock_core_init(t, THIS_MODULE);
> -}
> -void vsock_core_exit(void);
> +int vsock_core_register(const struct vsock_transport *t, int features);
> +void vsock_core_unregister(const struct vsock_transport *t);
>
>  /* The transport may downcast this to access transport-specific functions */
>  const struct vsock_transport *vsock_core_get_transport(struct vsock_sock *vsk);
> @@ -190,6 +194,7 @@ struct sock *vsock_find_connected_socket(struct sockaddr_vm *src,
>                                          struct sockaddr_vm *dst);
>  void vsock_remove_sock(struct vsock_sock *vsk);
>  void vsock_for_each_connected_socket(void (*fn)(struct sock *sk));
> +int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk);
>
>  /**** TAP ****/
>
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index d89381166028..dddd85d9a147 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -130,7 +130,12 @@ static struct proto vsock_proto = {
>  #define VSOCK_DEFAULT_BUFFER_MAX_SIZE (1024 * 256)
>  #define VSOCK_DEFAULT_BUFFER_MIN_SIZE 128
>
> -static const struct vsock_transport *transport_single;
> +/* Transport used for host->guest communication */
> +static const struct vsock_transport *transport_h2g;
> +/* Transport used for guest->host communication */
> +static const struct vsock_transport *transport_g2h;
> +/* Transport used for DGRAM communication */
> +static const struct vsock_transport *transport_dgram;
>  static DEFINE_MUTEX(vsock_register_mutex);
>
>  /**** UTILS ****/
> @@ -182,7 +187,7 @@ static int vsock_auto_bind(struct vsock_sock *vsk)
>         return __vsock_bind(sk, &local_addr);
>  }
>
> -static int __init vsock_init_tables(void)
> +static void vsock_init_tables(void)
>  {
>         int i;
>
> @@ -191,7 +196,6 @@ static int __init vsock_init_tables(void)
>
>         for (i = 0; i < ARRAY_SIZE(vsock_connected_table); i++)
>                 INIT_LIST_HEAD(&vsock_connected_table[i]);
> -       return 0;
>  }
>
>  static void __vsock_insert_bound(struct list_head *list,
> @@ -376,6 +380,62 @@ void vsock_enqueue_accept(struct sock *listener, struct sock *connected)
>  }
>  EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
>
> +/* Assign a transport to a socket and call the .init transport callback.
> + *
> + * Note: for stream socket this must be called when vsk->remote_addr is set
> + * (e.g. during the connect() or when a connection request on a listener
> + * socket is received).
> + * The vsk->remote_addr is used to decide which transport to use:
> + *  - remote CID > VMADDR_CID_HOST will use host->guest transport
> + *  - remote CID <= VMADDR_CID_HOST will use guest->host transport
> + */
> +int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> +{
> +       const struct vsock_transport *new_transport;
> +       struct sock *sk = sk_vsock(vsk);
> +
> +       switch (sk->sk_type) {
> +       case SOCK_DGRAM:
> +               new_transport = transport_dgram;
> +               break;
> +       case SOCK_STREAM:
> +               if (vsk->remote_addr.svm_cid > VMADDR_CID_HOST)
> +                       new_transport = transport_h2g;
> +               else
> +                       new_transport = transport_g2h;

I just noticed that this break the loopback in the guest.
As a fix, we should use 'transport_g2h' when remote_cid <= VMADDR_CID_HOST
or remote_cid is the id of 'transport_g2h'.

To do that we also need to avoid that L2 guests can have the same CID of L1.
For vhost_vsock I can call vsock_find_cid() in vhost_vsock_set_cid()

@Jorgen: for vmci we need to do the same? or it is guaranteed, since
it's already support nested VMs, that a L2 guests cannot have the
same CID as the L1.

I'll send a v2 with this fix, but I'll wait a bit for other comments.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
