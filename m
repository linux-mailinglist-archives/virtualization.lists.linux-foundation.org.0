Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B046851FC86
	for <lists.virtualization@lfdr.de>; Mon,  9 May 2022 14:19:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BC0F405B5;
	Mon,  9 May 2022 12:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pXmkvg0T8C3; Mon,  9 May 2022 12:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A51C140547;
	Mon,  9 May 2022 12:19:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C970C0081;
	Mon,  9 May 2022 12:19:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9B94C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 May 2022 12:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81FB240519
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 May 2022 12:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJMmL_Os5wdC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 May 2022 12:19:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9710404D1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 May 2022 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652098754; x=1683634754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=852D0WTiV+2Du4Tu2T0YU4FDc+Luix7a5hJXfT75Uas=;
 b=erKgUhjGvneOxY4ZcHyD704wfwc5VBIt2LSAXviLKDelz7G7dHYiNHEx
 uvV3PePpqw3uxmDk3V5opEXcObhTNNtHbahcOjpVj5ignHwRukheGEtvN
 a7k/4pQrSBu4XfPtUs/uhZzizoO+ESvGgx//uQqQAhzMSafevGetKOIoU
 o5V/fG327pUXMJrIhISY+2r6rtcLDCbpJmEtTj7bZCBbvWwOsCXMamhqF
 S6o9bnQlV701nWe2RAz1wrAa5XY4ClIKZ+K8zqZxXRcdLBaIb+kyANmP1
 J/6rEJ2VlX/OhbX0N1z0j5xBan4CVKnEkF4l/hCLzHnP9g9Lyr72W73/D g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="355459935"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355459935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="550997607"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 09 May 2022 05:19:10 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1no2M2-000GUq-4h;
 Mon, 09 May 2022 12:19:10 +0000
Date: Mon, 9 May 2022 20:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>, jasowang@redhat.com, mst@redhat.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1] vdpa: Do not count the pages that were already pinned
 in the vhost-vDPA
Message-ID: <202205092017.ywsnJTzp-lkp@intel.com>
References: <20220509071426.155941-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509071426.155941-1-lulu@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
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

Hi Cindy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linux/master linus/master v5.18-rc6]
[cannot apply to next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vdpa-Do-not-count-the-pages-that-were-already-pinned-in-the-vhost-vDPA/20220509-152644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
config: x86_64-randconfig-c007-20220509 (https://download.01.org/0day-ci/archive/20220509/202205092017.ywsnJTzp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4225cc2a756b75d1e0ff7ca2a593bada42def380
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cindy-Lu/vdpa-Do-not-count-the-pages-that-were-already-pinned-in-the-vhost-vDPA/20220509-152644
        git checkout 4225cc2a756b75d1e0ff7ca2a593bada42def380
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vhost/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vhost/vdpa.c:542:5: warning: no previous prototype for function 'vhost_vdpa_add_range_ctx' [-Wmissing-prototypes]
   int vhost_vdpa_add_range_ctx(struct rb_root_cached *root, u64 start, u64 last)
       ^
   drivers/vhost/vdpa.c:542:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vhost_vdpa_add_range_ctx(struct rb_root_cached *root, u64 start, u64 last)
   ^
   static 
>> drivers/vhost/vdpa.c:571:6: warning: no previous prototype for function 'vhost_vdpa_del_range' [-Wmissing-prototypes]
   void vhost_vdpa_del_range(struct rb_root_cached *root, u64 start, u64 last)
        ^
   drivers/vhost/vdpa.c:571:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vhost_vdpa_del_range(struct rb_root_cached *root, u64 start, u64 last)
   ^
   static 
>> drivers/vhost/vdpa.c:581:28: warning: no previous prototype for function 'vhost_vdpa_search_range' [-Wmissing-prototypes]
   struct interval_tree_node *vhost_vdpa_search_range(struct rb_root_cached *root,
                              ^
   drivers/vhost/vdpa.c:581:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct interval_tree_node *vhost_vdpa_search_range(struct rb_root_cached *root,
   ^
   static 
   3 warnings generated.


vim +/vhost_vdpa_add_range_ctx +542 drivers/vhost/vdpa.c

   464	
   465	static long vhost_vdpa_unlocked_ioctl(struct file *filep,
   466					      unsigned int cmd, unsigned long arg)
   467	{
   468		struct vhost_vdpa *v = filep->private_data;
   469		struct vhost_dev *d = &v->vdev;
   470		void __user *argp = (void __user *)arg;
   471		u64 __user *featurep = argp;
   472		u64 features;
   473		long r = 0;
   474	
   475		if (cmd == VHOST_SET_BACKEND_FEATURES) {
   476			if (copy_from_user(&features, featurep, sizeof(features)))
   477				return -EFAULT;
   478			if (features & ~VHOST_VDPA_BACKEND_FEATURES)
   479				return -EOPNOTSUPP;
   480			vhost_set_backend_features(&v->vdev, features);
   481			return 0;
   482		}
   483	
   484		mutex_lock(&d->mutex);
   485	
   486		switch (cmd) {
   487		case VHOST_VDPA_GET_DEVICE_ID:
   488			r = vhost_vdpa_get_device_id(v, argp);
   489			break;
   490		case VHOST_VDPA_GET_STATUS:
   491			r = vhost_vdpa_get_status(v, argp);
   492			break;
   493		case VHOST_VDPA_SET_STATUS:
   494			r = vhost_vdpa_set_status(v, argp);
   495			break;
   496		case VHOST_VDPA_GET_CONFIG:
   497			r = vhost_vdpa_get_config(v, argp);
   498			break;
   499		case VHOST_VDPA_SET_CONFIG:
   500			r = vhost_vdpa_set_config(v, argp);
   501			break;
   502		case VHOST_GET_FEATURES:
   503			r = vhost_vdpa_get_features(v, argp);
   504			break;
   505		case VHOST_SET_FEATURES:
   506			r = vhost_vdpa_set_features(v, argp);
   507			break;
   508		case VHOST_VDPA_GET_VRING_NUM:
   509			r = vhost_vdpa_get_vring_num(v, argp);
   510			break;
   511		case VHOST_SET_LOG_BASE:
   512		case VHOST_SET_LOG_FD:
   513			r = -ENOIOCTLCMD;
   514			break;
   515		case VHOST_VDPA_SET_CONFIG_CALL:
   516			r = vhost_vdpa_set_config_call(v, argp);
   517			break;
   518		case VHOST_GET_BACKEND_FEATURES:
   519			features = VHOST_VDPA_BACKEND_FEATURES;
   520			if (copy_to_user(featurep, &features, sizeof(features)))
   521				r = -EFAULT;
   522			break;
   523		case VHOST_VDPA_GET_IOVA_RANGE:
   524			r = vhost_vdpa_get_iova_range(v, argp);
   525			break;
   526		case VHOST_VDPA_GET_CONFIG_SIZE:
   527			r = vhost_vdpa_get_config_size(v, argp);
   528			break;
   529		case VHOST_VDPA_GET_VQS_COUNT:
   530			r = vhost_vdpa_get_vqs_count(v, argp);
   531			break;
   532		default:
   533			r = vhost_dev_ioctl(&v->vdev, cmd, argp);
   534			if (r == -ENOIOCTLCMD)
   535				r = vhost_vdpa_vring_ioctl(v, cmd, argp);
   536			break;
   537		}
   538	
   539		mutex_unlock(&d->mutex);
   540		return r;
   541	}
 > 542	int vhost_vdpa_add_range_ctx(struct rb_root_cached *root, u64 start, u64 last)
   543	{
   544		struct interval_tree_node *new_node;
   545	
   546		if (last < start)
   547			return -EFAULT;
   548	
   549		/* If the range being mapped is [0, ULONG_MAX], split it into two entries
   550		 * otherwise its size would overflow u64.
   551		 */
   552		if (start == 0 && last == ULONG_MAX) {
   553			u64 mid = last / 2;
   554	
   555			vhost_vdpa_add_range_ctx(root, start, mid);
   556			start = mid + 1;
   557		}
   558	
   559		new_node = kmalloc(sizeof(struct interval_tree_node), GFP_ATOMIC);
   560		if (!new_node)
   561			return -ENOMEM;
   562	
   563		new_node->start = start;
   564		new_node->last = last;
   565	
   566		interval_tree_insert(new_node, root);
   567	
   568		return 0;
   569	}
   570	
 > 571	void vhost_vdpa_del_range(struct rb_root_cached *root, u64 start, u64 last)
   572	{
   573		struct interval_tree_node *new_node;
   574	
   575		while ((new_node = interval_tree_iter_first(root, start, last))) {
   576			interval_tree_remove(new_node, root);
   577			kfree(new_node);
   578		}
   579	}
   580	
 > 581	struct interval_tree_node *vhost_vdpa_search_range(struct rb_root_cached *root,
   582							   u64 start, u64 last)
   583	{
   584		return interval_tree_iter_first(root, start, last);
   585	}
   586	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
