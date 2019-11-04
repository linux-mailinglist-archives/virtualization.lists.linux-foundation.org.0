Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B1EDC26
	for <lists.virtualization@lfdr.de>; Mon,  4 Nov 2019 11:10:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2E46ECE;
	Mon,  4 Nov 2019 10:10:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A0EF6EBA
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 10:10:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 86397710
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 10:10:16 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ABF685A03
	for <virtualization@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 10:10:15 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id e25so10227473wra.9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 04 Nov 2019 02:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=g+8Oj0bCYOu+EhlP3wibB9YhJUghmgDH8FSiQZ7/iSA=;
	b=WkbDebXUGy4nr36m2W4jH1EDyf/3ORl8GqQuUwbrGJsdBkucrKkyUeKWq63zRI90ae
	TIabpiyfUrVUMY9YoKNGo2p8WPfofpJVID04/GU/t41byvJQ6n3XcxmG1glmuvjLPvVB
	p1fzXp67E0SxtCRf91Zo0C8AO1uM4Se4I4bA6x6W2RbjHbrRp1pY6A30nDnCxkL1Eo53
	zjeO+1OYGIlsWlMpNODaXHApL6p3DUm9x4GLpjPQ/qxqEX+j5qTIMhu1Wq+vWNB4I2+o
	Dxd7DiGBHwK5PFgtcsCfNF43w0S8h6crPa6u7Ajv3udwHCzexQZKpvxZFMbtps67GW/l
	Ov3A==
X-Gm-Message-State: APjAAAV81k9/yNPNDezPEJXFbSPpk+oHaKt6zWkUm8x+wmfhV8lnjk3p
	wMy3O5zfUmdI6TE5O5LC0HYnVe50IoZiwFupZzbKe1Ai+/pIkPqqlhP0SobmrBdG9YyulArSJ2b
	bJr/qgE0zUaFwDLlvbT28ufcsVVi6V5URGj/JKYCotg==
X-Received: by 2002:a5d:5391:: with SMTP id d17mr185671wrv.382.1572862213943; 
	Mon, 04 Nov 2019 02:10:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxH1lap2B0a/ZOQA/meVQma9lyYnliFOKbdX4X0tlkJRdHzNLtyTsr3l9TCUV9K4c/wzZBv0w==
X-Received: by 2002:a5d:5391:: with SMTP id d17mr185643wrv.382.1572862213586; 
	Mon, 04 Nov 2019 02:10:13 -0800 (PST)
Received: from steredhat.homenet.telecomitalia.it (a-nu5-32.tin.it.
	[212.216.181.31])
	by smtp.gmail.com with ESMTPSA id z9sm20176624wrv.1.2019.11.04.02.10.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 02:10:13 -0800 (PST)
Date: Mon, 4 Nov 2019 11:10:10 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Message-ID: <20191104101010.we3nsgh4gxiu4vh5@steredhat.homenet.telecomitalia.it>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023095554.11340-13-sgarzare@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, netdev@vger.kernel.org,
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

Hi Jorgen,
I'm preparing the v2, but first, if you have time, I'd like to have
a comment from you on this patch that modifies a bit vmci.

Thank you very much,
Stefano

On Wed, Oct 23, 2019 at 11:55:52AM +0200, Stefano Garzarella wrote:
> To allow other transports to be loaded with vmci_transport,
> we register the vmci_transport as G2H or H2G only when a VMCI guest
> or host is active.
> 
> To do that, this patch adds a callback registered in the vmci driver
> that will be called when a new host or guest become active.
> This callback will register the vmci_transport in the VSOCK core.
> If the transport is already registered, we ignore the error coming
> from vsock_core_register().
> 
> Cc: Jorgen Hansen <jhansen@vmware.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  drivers/misc/vmw_vmci/vmci_driver.c | 50 +++++++++++++++++++++++++++++
>  drivers/misc/vmw_vmci/vmci_driver.h |  2 ++
>  drivers/misc/vmw_vmci/vmci_guest.c  |  2 ++
>  drivers/misc/vmw_vmci/vmci_host.c   |  7 ++++
>  include/linux/vmw_vmci_api.h        |  2 ++
>  net/vmw_vsock/vmci_transport.c      | 29 +++++++++++------
>  6 files changed, 82 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/misc/vmw_vmci/vmci_driver.c b/drivers/misc/vmw_vmci/vmci_driver.c
> index 819e35995d32..195afbd7edc1 100644
> --- a/drivers/misc/vmw_vmci/vmci_driver.c
> +++ b/drivers/misc/vmw_vmci/vmci_driver.c
> @@ -28,6 +28,9 @@ MODULE_PARM_DESC(disable_guest,
>  static bool vmci_guest_personality_initialized;
>  static bool vmci_host_personality_initialized;
>  
> +static DEFINE_MUTEX(vmci_vsock_mutex); /* protects vmci_vsock_transport_cb */
> +static vmci_vsock_cb vmci_vsock_transport_cb;
> +
>  /*
>   * vmci_get_context_id() - Gets the current context ID.
>   *
> @@ -45,6 +48,53 @@ u32 vmci_get_context_id(void)
>  }
>  EXPORT_SYMBOL_GPL(vmci_get_context_id);
>  
> +/*
> + * vmci_register_vsock_callback() - Register the VSOCK vmci_transport callback.
> + *
> + * The callback will be called every time a new host or guest become active,
> + * or if they are already active when this function is called.
> + * To unregister the callback, call this function with NULL parameter.
> + *
> + * Returns 0 on success. -EBUSY if a callback is already registered.
> + */
> +int vmci_register_vsock_callback(vmci_vsock_cb callback)
> +{
> +	int err = 0;
> +
> +	mutex_lock(&vmci_vsock_mutex);
> +
> +	if (vmci_vsock_transport_cb && callback) {
> +		err = -EBUSY;
> +		goto out;
> +	}
> +
> +	vmci_vsock_transport_cb = callback;
> +
> +	if (!vmci_vsock_transport_cb)
> +		goto out;
> +
> +	if (vmci_guest_code_active())
> +		vmci_vsock_transport_cb(false);
> +
> +	if (vmci_host_users() > 0)
> +		vmci_vsock_transport_cb(true);
> +
> +out:
> +	mutex_unlock(&vmci_vsock_mutex);
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(vmci_register_vsock_callback);
> +
> +void vmci_call_vsock_callback(bool is_host)
> +{
> +	mutex_lock(&vmci_vsock_mutex);
> +
> +	if (vmci_vsock_transport_cb)
> +		vmci_vsock_transport_cb(is_host);
> +
> +	mutex_unlock(&vmci_vsock_mutex);
> +}
> +
>  static int __init vmci_drv_init(void)
>  {
>  	int vmci_err;
> diff --git a/drivers/misc/vmw_vmci/vmci_driver.h b/drivers/misc/vmw_vmci/vmci_driver.h
> index aab81b67670c..990682480bf6 100644
> --- a/drivers/misc/vmw_vmci/vmci_driver.h
> +++ b/drivers/misc/vmw_vmci/vmci_driver.h
> @@ -36,10 +36,12 @@ extern struct pci_dev *vmci_pdev;
>  
>  u32 vmci_get_context_id(void);
>  int vmci_send_datagram(struct vmci_datagram *dg);
> +void vmci_call_vsock_callback(bool is_host);
>  
>  int vmci_host_init(void);
>  void vmci_host_exit(void);
>  bool vmci_host_code_active(void);
> +int vmci_host_users(void);
>  
>  int vmci_guest_init(void);
>  void vmci_guest_exit(void);
> diff --git a/drivers/misc/vmw_vmci/vmci_guest.c b/drivers/misc/vmw_vmci/vmci_guest.c
> index 7a84a48c75da..cc8eeb361fcd 100644
> --- a/drivers/misc/vmw_vmci/vmci_guest.c
> +++ b/drivers/misc/vmw_vmci/vmci_guest.c
> @@ -637,6 +637,8 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
>  		  vmci_dev->iobase + VMCI_CONTROL_ADDR);
>  
>  	pci_set_drvdata(pdev, vmci_dev);
> +
> +	vmci_call_vsock_callback(false);
>  	return 0;
>  
>  err_free_irq:
> diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
> index 833e2bd248a5..ff3c396146ff 100644
> --- a/drivers/misc/vmw_vmci/vmci_host.c
> +++ b/drivers/misc/vmw_vmci/vmci_host.c
> @@ -108,6 +108,11 @@ bool vmci_host_code_active(void)
>  	     atomic_read(&vmci_host_active_users) > 0);
>  }
>  
> +int vmci_host_users(void)
> +{
> +	return atomic_read(&vmci_host_active_users);
> +}
> +
>  /*
>   * Called on open of /dev/vmci.
>   */
> @@ -338,6 +343,8 @@ static int vmci_host_do_init_context(struct vmci_host_dev *vmci_host_dev,
>  	vmci_host_dev->ct_type = VMCIOBJ_CONTEXT;
>  	atomic_inc(&vmci_host_active_users);
>  
> +	vmci_call_vsock_callback(true);
> +
>  	retval = 0;
>  
>  out:
> diff --git a/include/linux/vmw_vmci_api.h b/include/linux/vmw_vmci_api.h
> index acd9fafe4fc6..f28907345c80 100644
> --- a/include/linux/vmw_vmci_api.h
> +++ b/include/linux/vmw_vmci_api.h
> @@ -19,6 +19,7 @@
>  struct msghdr;
>  typedef void (vmci_device_shutdown_fn) (void *device_registration,
>  					void *user_data);
> +typedef void (*vmci_vsock_cb) (bool is_host);
>  
>  int vmci_datagram_create_handle(u32 resource_id, u32 flags,
>  				vmci_datagram_recv_cb recv_cb,
> @@ -37,6 +38,7 @@ int vmci_doorbell_destroy(struct vmci_handle handle);
>  int vmci_doorbell_notify(struct vmci_handle handle, u32 priv_flags);
>  u32 vmci_get_context_id(void);
>  bool vmci_is_context_owner(u32 context_id, kuid_t uid);
> +int vmci_register_vsock_callback(vmci_vsock_cb callback);
>  
>  int vmci_event_subscribe(u32 event,
>  			 vmci_event_cb callback, void *callback_data,
> diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
> index 2eb3f16d53e7..04437f822d82 100644
> --- a/net/vmw_vsock/vmci_transport.c
> +++ b/net/vmw_vsock/vmci_transport.c
> @@ -2053,19 +2053,22 @@ static bool vmci_check_transport(struct vsock_sock *vsk)
>  	return vsk->transport == &vmci_transport;
>  }
>  
> -static int __init vmci_transport_init(void)
> +void vmci_vsock_transport_cb(bool is_host)
>  {
> -	int features = VSOCK_TRANSPORT_F_DGRAM | VSOCK_TRANSPORT_F_H2G;
> -	int cid;
> -	int err;
> +	int features;
>  
> -	cid = vmci_get_context_id();
> +	if (is_host)
> +		features = VSOCK_TRANSPORT_F_H2G;
> +	else
> +		features = VSOCK_TRANSPORT_F_G2H;
>  
> -	if (cid == VMCI_INVALID_ID)
> -		return -EINVAL;
> +	vsock_core_register(&vmci_transport, features);
> +}
>  
> -	if (cid != VMCI_HOST_CONTEXT_ID)
> -		features |= VSOCK_TRANSPORT_F_G2H;
> +static int __init vmci_transport_init(void)
> +{
> +	int features = VSOCK_TRANSPORT_F_DGRAM;
> +	int err;
>  
>  	/* Create the datagram handle that we will use to send and receive all
>  	 * VSocket control messages for this context.
> @@ -2079,7 +2082,6 @@ static int __init vmci_transport_init(void)
>  		pr_err("Unable to create datagram handle. (%d)\n", err);
>  		return vmci_transport_error_to_vsock_error(err);
>  	}
> -
>  	err = vmci_event_subscribe(VMCI_EVENT_QP_RESUMED,
>  				   vmci_transport_qp_resumed_cb,
>  				   NULL, &vmci_transport_qp_resumed_sub_id);
> @@ -2094,8 +2096,14 @@ static int __init vmci_transport_init(void)
>  	if (err < 0)
>  		goto err_unsubscribe;
>  
> +	err = vmci_register_vsock_callback(vmci_vsock_transport_cb);
> +	if (err < 0)
> +		goto err_unregister;
> +
>  	return 0;
>  
> +err_unregister:
> +	vsock_core_unregister(&vmci_transport);
>  err_unsubscribe:
>  	vmci_event_unsubscribe(vmci_transport_qp_resumed_sub_id);
>  err_destroy_stream_handle:
> @@ -2121,6 +2129,7 @@ static void __exit vmci_transport_exit(void)
>  		vmci_transport_qp_resumed_sub_id = VMCI_INVALID_ID;
>  	}
>  
> +	vmci_register_vsock_callback(NULL);
>  	vsock_core_unregister(&vmci_transport);
>  }
>  module_exit(vmci_transport_exit);
> -- 
> 2.21.0
> 

-- 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
