Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410C6A1053
	for <lists.virtualization@lfdr.de>; Thu, 23 Feb 2023 20:12:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CD4816F5;
	Thu, 23 Feb 2023 19:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CD4816F5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQl0zOdj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kORLmTHF9bf; Thu, 23 Feb 2023 19:12:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4FD2381750;
	Thu, 23 Feb 2023 19:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD2381750
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62298C0078;
	Thu, 23 Feb 2023 19:12:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B568CC002B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 19:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89E4C60A71
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 19:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89E4C60A71
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=WQl0zOdj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjMA1OomGUkL
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 19:12:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C1960899
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98C1960899
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677179562; x=1708715562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aiB5KRHpbkzp3tz5LlrbbklWYZfRmlsl6vQuzKhAJTk=;
 b=WQl0zOdjzYC5dd1yE023EY0esDkyO6S2v++i/VfrMTexkT+SdBNwZrkF
 8GIdGqiffUs6sGdOFeuOPqw2+2EVh2TGVqsK8+JyhUBf3HvkxP3v4qdtk
 YBDxtzGPgSCv3Mfe1zQRaBAJBg4pry+9p9OkI1jyhq8r/zBoeLSxdJnHb
 Xc1Pyq83hZI/XUvRQc8at+B1ocBL3wF13L2OOzZ4b0sZryI5fYV5EMBO7
 FzpPjMw+dOPQ6N9DifRhEfqFMJXygzQsk8foZIn9wO8bXaulS3+QRM8OX
 +/W9oBq810oez/fyKxaHO+qipJfgHcivTNiDRm3DCRp4uKWcWgEzK2xjZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331980100"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="331980100"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 11:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="918136375"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="918136375"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2023 11:12:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pVH0p-0001eb-1F;
 Thu, 23 Feb 2023 19:12:15 +0000
Date: Fri, 24 Feb 2023 03:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Bradford via B4 Relay <devnull+rbradford.rivosinc.com@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] virtio-net: Fix probe of virtio-net on kvmtool
Message-ID: <202302240220.zJZ4uyZI-lkp@intel.com>
References: <20230223-virtio-net-kvmtool-v1-1-fc23d29b9d7a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223-virtio-net-kvmtool-v1-1-fc23d29b9d7a@rivosinc.com>
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Rob Bradford <rbradford@rivosinc.com>,
 oe-kbuild-all@lists.linux.dev
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

Hi Rob,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on c39cea6f38eefe356d64d0bc1e1f2267e282cdd3]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Bradford-via-B4-Relay/virtio-net-Fix-probe-of-virtio-net-on-kvmtool/20230224-011509
base:   c39cea6f38eefe356d64d0bc1e1f2267e282cdd3
patch link:    https://lore.kernel.org/r/20230223-virtio-net-kvmtool-v1-1-fc23d29b9d7a%40rivosinc.com
patch subject: [PATCH] virtio-net: Fix probe of virtio-net on kvmtool
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302240220.zJZ4uyZI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c778354a380764fd994634e06be5c8047591d138
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Bradford-via-B4-Relay/virtio-net-Fix-probe-of-virtio-net-on-kvmtool/20230224-011509
        git checkout c778354a380764fd994634e06be5c8047591d138
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240220.zJZ4uyZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/virtio_net.c: In function 'virtnet_probe':
>> drivers/net/virtio_net.c:3784:63: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
    3784 |             virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6) &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
    3785 |             virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3784 drivers/net/virtio_net.c

  3719	
  3720	static int virtnet_probe(struct virtio_device *vdev)
  3721	{
  3722		int i, err = -ENOMEM;
  3723		struct net_device *dev;
  3724		struct virtnet_info *vi;
  3725		u16 max_queue_pairs;
  3726		int mtu = 0;
  3727	
  3728		/* Find if host supports multiqueue/rss virtio_net device */
  3729		max_queue_pairs = 1;
  3730		if (virtio_has_feature(vdev, VIRTIO_NET_F_MQ) || virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
  3731			max_queue_pairs =
  3732			     virtio_cread16(vdev, offsetof(struct virtio_net_config, max_virtqueue_pairs));
  3733	
  3734		/* We need at least 2 queue's */
  3735		if (max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
  3736		    max_queue_pairs > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
  3737		    !virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
  3738			max_queue_pairs = 1;
  3739	
  3740		/* Allocate ourselves a network device with room for our info */
  3741		dev = alloc_etherdev_mq(sizeof(struct virtnet_info), max_queue_pairs);
  3742		if (!dev)
  3743			return -ENOMEM;
  3744	
  3745		/* Set up network device as normal. */
  3746		dev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE |
  3747				   IFF_TX_SKB_NO_LINEAR;
  3748		dev->netdev_ops = &virtnet_netdev;
  3749		dev->features = NETIF_F_HIGHDMA;
  3750	
  3751		dev->ethtool_ops = &virtnet_ethtool_ops;
  3752		SET_NETDEV_DEV(dev, &vdev->dev);
  3753	
  3754		/* Do we support "hardware" checksums? */
  3755		if (virtio_has_feature(vdev, VIRTIO_NET_F_CSUM)) {
  3756			/* This opens up the world of extra features. */
  3757			dev->hw_features |= NETIF_F_HW_CSUM | NETIF_F_SG;
  3758			if (csum)
  3759				dev->features |= NETIF_F_HW_CSUM | NETIF_F_SG;
  3760	
  3761			if (virtio_has_feature(vdev, VIRTIO_NET_F_GSO)) {
  3762				dev->hw_features |= NETIF_F_TSO
  3763					| NETIF_F_TSO_ECN | NETIF_F_TSO6;
  3764			}
  3765			/* Individual feature bits: what can host handle? */
  3766			if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_TSO4))
  3767				dev->hw_features |= NETIF_F_TSO;
  3768			if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_TSO6))
  3769				dev->hw_features |= NETIF_F_TSO6;
  3770			if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_ECN))
  3771				dev->hw_features |= NETIF_F_TSO_ECN;
  3772			if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_USO))
  3773				dev->hw_features |= NETIF_F_GSO_UDP_L4;
  3774	
  3775			dev->features |= NETIF_F_GSO_ROBUST;
  3776	
  3777			if (gso)
  3778				dev->features |= dev->hw_features & NETIF_F_ALL_TSO;
  3779			/* (!csum && gso) case will be fixed by register_netdev() */
  3780		}
  3781		if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_CSUM))
  3782			dev->features |= NETIF_F_RXCSUM;
  3783		if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> 3784		    virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6) &&
  3785		    virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
  3786			dev->hw_features |= NETIF_F_GRO_HW;
  3787	
  3788		dev->vlan_features = dev->features;
  3789	
  3790		/* MTU range: 68 - 65535 */
  3791		dev->min_mtu = MIN_MTU;
  3792		dev->max_mtu = MAX_MTU;
  3793	
  3794		/* Configuration may specify what MAC to use.  Otherwise random. */
  3795		if (virtio_has_feature(vdev, VIRTIO_NET_F_MAC)) {
  3796			u8 addr[ETH_ALEN];
  3797	
  3798			virtio_cread_bytes(vdev,
  3799					   offsetof(struct virtio_net_config, mac),
  3800					   addr, ETH_ALEN);
  3801			eth_hw_addr_set(dev, addr);
  3802		} else {
  3803			eth_hw_addr_random(dev);
  3804		}
  3805	
  3806		/* Set up our device-specific information */
  3807		vi = netdev_priv(dev);
  3808		vi->dev = dev;
  3809		vi->vdev = vdev;
  3810		vdev->priv = vi;
  3811	
  3812		INIT_WORK(&vi->config_work, virtnet_config_changed_work);
  3813		spin_lock_init(&vi->refill_lock);
  3814	
  3815		if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF))
  3816			vi->mergeable_rx_bufs = true;
  3817	
  3818		if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL)) {
  3819			vi->rx_usecs = 0;
  3820			vi->tx_usecs = 0;
  3821			vi->tx_max_packets = 0;
  3822			vi->rx_max_packets = 0;
  3823		}
  3824	
  3825		if (virtio_has_feature(vdev, VIRTIO_NET_F_HASH_REPORT))
  3826			vi->has_rss_hash_report = true;
  3827	
  3828		if (virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
  3829			vi->has_rss = true;
  3830	
  3831		if (vi->has_rss || vi->has_rss_hash_report) {
  3832			vi->rss_indir_table_size =
  3833				virtio_cread16(vdev, offsetof(struct virtio_net_config,
  3834					rss_max_indirection_table_length));
  3835			vi->rss_key_size =
  3836				virtio_cread8(vdev, offsetof(struct virtio_net_config, rss_max_key_size));
  3837	
  3838			vi->rss_hash_types_supported =
  3839			    virtio_cread32(vdev, offsetof(struct virtio_net_config, supported_hash_types));
  3840			vi->rss_hash_types_supported &=
  3841					~(VIRTIO_NET_RSS_HASH_TYPE_IP_EX |
  3842					  VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
  3843					  VIRTIO_NET_RSS_HASH_TYPE_UDP_EX);
  3844	
  3845			dev->hw_features |= NETIF_F_RXHASH;
  3846		}
  3847	
  3848		if (vi->has_rss_hash_report)
  3849			vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
  3850		else if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF) ||
  3851			 virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
  3852			vi->hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
  3853		else
  3854			vi->hdr_len = sizeof(struct virtio_net_hdr);
  3855	
  3856		if (virtio_has_feature(vdev, VIRTIO_F_ANY_LAYOUT) ||
  3857		    virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
  3858			vi->any_header_sg = true;
  3859	
  3860		if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
  3861			vi->has_cvq = true;
  3862	
  3863		if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
  3864			mtu = virtio_cread16(vdev,
  3865					     offsetof(struct virtio_net_config,
  3866						      mtu));
  3867			if (mtu < dev->min_mtu) {
  3868				/* Should never trigger: MTU was previously validated
  3869				 * in virtnet_validate.
  3870				 */
  3871				dev_err(&vdev->dev,
  3872					"device MTU appears to have changed it is now %d < %d",
  3873					mtu, dev->min_mtu);
  3874				err = -EINVAL;
  3875				goto free;
  3876			}
  3877	
  3878			dev->mtu = mtu;
  3879			dev->max_mtu = mtu;
  3880		}
  3881	
  3882		virtnet_set_big_packets(vi, mtu);
  3883	
  3884		if (vi->any_header_sg)
  3885			dev->needed_headroom = vi->hdr_len;
  3886	
  3887		/* Enable multiqueue by default */
  3888		if (num_online_cpus() >= max_queue_pairs)
  3889			vi->curr_queue_pairs = max_queue_pairs;
  3890		else
  3891			vi->curr_queue_pairs = num_online_cpus();
  3892		vi->max_queue_pairs = max_queue_pairs;
  3893	
  3894		/* Allocate/initialize the rx/tx queues, and invoke find_vqs */
  3895		err = init_vqs(vi);
  3896		if (err)
  3897			goto free;
  3898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
