Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1865F71FFDE
	for <lists.virtualization@lfdr.de>; Fri,  2 Jun 2023 13:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AEA161601;
	Fri,  2 Jun 2023 11:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEA161601
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxlmWQZR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_U7RRK8oI9D; Fri,  2 Jun 2023 11:00:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 83CEC615F5;
	Fri,  2 Jun 2023 11:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83CEC615F5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4540C0088;
	Fri,  2 Jun 2023 11:00:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA990C0029
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 11:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B79C68442E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 11:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79C68442E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxlmWQZR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADqPYuppD1hG
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 11:00:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 996C484429
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 996C484429
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Jun 2023 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685703606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0BT6WpvGnmKoOwXdJdOKLvUUoq9vXWPy+fxEo1qghHI=;
 b=fxlmWQZRFxgStikirWUsY+GaDj1J7HkM5jD7J1XQz3kKeKtmmio0OsnzRbvOfOjQJqwgZZ
 nOo/aMWxJG/VJRn+qhvTWIpL16KhoGvZOJTOmDEgj13EWhCEJEuRh+lHufFtgv9y8DcSHj
 nppETI6UvOUmjJt0H1JfLoTAR5DP5dM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-8TY3I5thOV6VtqKNY9GcVg-1; Fri, 02 Jun 2023 07:00:05 -0400
X-MC-Unique: 8TY3I5thOV6VtqKNY9GcVg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f6069f764bso32698685e9.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 02 Jun 2023 04:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685703604; x=1688295604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BT6WpvGnmKoOwXdJdOKLvUUoq9vXWPy+fxEo1qghHI=;
 b=eySrFVbhuAMYAQsJoQ8o0uQVsAXddGgohjbynVoFBJvMwTimDO1o6QDJFJPrKMU/dQ
 hluhJdODO6nYYTdvutSuxRbN/gMJMWmJPw/GPKSg/mxMYSVkOfZhQAeCSZ/rgxinIQ6p
 RqKBJYbJOylK2QzdvQwEW2GaaKu60Sy4J3pB15IMwUkU5U5OQB4Jg0GXOW78s5xi1MGV
 uSgwyfLTz/rvKKOlhG/4tDxMkV0xv7jJlHjVQVhZcT88nWWQAEX5nOxG/X0/CymLV2ox
 Om2qNgFvKFJgoBqQZW1cPVIjw0HI6Xn8bSnkvwIrQqXGwEgAjgeYWQqqibunwmLEQGQ+
 n8Kw==
X-Gm-Message-State: AC+VfDzTGbi5gALDYgMyGQux+3xeDrurOPX4XYd0WCvpuq+yB99g8YNT
 EzjZWY53CgHovBCXo3L1AsLt8UQose6Y8OU7gDogNZfSVkejl6PhyRJdvjE4pzC/f1aNcYxTwBT
 trzDqP2BOiMOQ+8V+3i7j/SF692K0YgSjd/D0rojw2Q==
X-Received: by 2002:a05:600c:c2:b0:3f5:fbd0:94ab with SMTP id
 u2-20020a05600c00c200b003f5fbd094abmr1838396wmm.3.1685703603947; 
 Fri, 02 Jun 2023 04:00:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dCMn2oAPJ0MMC3LQYmxajH/Hc8VdwaxV63HUajKCCpIdm/B47SM02Gd70ZSGLlr3K+wCLzA==
X-Received: by 2002:a05:600c:c2:b0:3f5:fbd0:94ab with SMTP id
 u2-20020a05600c00c200b003f5fbd094abmr1838378wmm.3.1685703603492; 
 Fri, 02 Jun 2023 04:00:03 -0700 (PDT)
Received: from redhat.com ([2.55.41.2]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c0b4700b003f4f89bc48dsm5144311wmr.15.2023.06.02.04.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 04:00:02 -0700 (PDT)
Date: Fri, 2 Jun 2023 06:59:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/1] vringh: IOMEM support
Message-ID: <20230602065929-mutt-send-email-mst@kernel.org>
References: <20230602055211.309960-2-mie@igel.co.jp>
 <202306021725.3otSfXPF-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202306021725.3otSfXPF-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Shunsuke Mie <mie@igel.co.jp>,
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

On Fri, Jun 02, 2023 at 05:56:12PM +0800, kernel test robot wrote:
> Hi Shunsuke,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on mst-vhost/linux-next]
> [also build test WARNING on linus/master horms-ipvs/master v6.4-rc4 next-20230602]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shunsuke-Mie/vringh-IOMEM-support/20230602-135351
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
> patch link:    https://lore.kernel.org/r/20230602055211.309960-2-mie%40igel.co.jp
> patch subject: [PATCH v4 1/1] vringh: IOMEM support
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306021725.3otSfXPF-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/de2a1f5220c32e953400f225aba6bd294a8d41b8
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Shunsuke-Mie/vringh-IOMEM-support/20230602-135351
>         git checkout de2a1f5220c32e953400f225aba6bd294a8d41b8
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306021725.3otSfXPF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/vhost/vringh.c:1661:5: warning: no previous prototype for 'vringh_init_iomem' [-Wmissing-prototypes]
>     1661 | int vringh_init_iomem(struct vringh *vrh, u64 features, unsigned int num,
>          |     ^~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1683:5: warning: no previous prototype for 'vringh_getdesc_iomem' [-Wmissing-prototypes]
>     1683 | int vringh_getdesc_iomem(struct vringh *vrh, struct vringh_kiov *riov,
>          |     ^~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1714:9: warning: no previous prototype for 'vringh_iov_pull_iomem' [-Wmissing-prototypes]
>     1714 | ssize_t vringh_iov_pull_iomem(struct vringh *vrh, struct vringh_kiov *riov,
>          |         ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1729:9: warning: no previous prototype for 'vringh_iov_push_iomem' [-Wmissing-prototypes]
>     1729 | ssize_t vringh_iov_push_iomem(struct vringh *vrh, struct vringh_kiov *wiov,
>          |         ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1744:6: warning: no previous prototype for 'vringh_abandon_iomem' [-Wmissing-prototypes]
>     1744 | void vringh_abandon_iomem(struct vringh *vrh, unsigned int num)
>          |      ^~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1759:5: warning: no previous prototype for 'vringh_complete_iomem' [-Wmissing-prototypes]
>     1759 | int vringh_complete_iomem(struct vringh *vrh, u16 head, u32 len)
>          |     ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1777:6: warning: no previous prototype for 'vringh_notify_enable_iomem' [-Wmissing-prototypes]
>     1777 | bool vringh_notify_enable_iomem(struct vringh *vrh)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1790:6: warning: no previous prototype for 'vringh_notify_disable_iomem' [-Wmissing-prototypes]
>     1790 | void vringh_notify_disable_iomem(struct vringh *vrh)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/vhost/vringh.c:1802:5: warning: no previous prototype for 'vringh_need_notify_iomem' [-Wmissing-prototypes]
>     1802 | int vringh_need_notify_iomem(struct vringh *vrh)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/vringh_init_iomem +1661 drivers/vhost/vringh.c


You probably should put the relevant code within ifdef.

>   1647	
>   1648	/**
>   1649	 * vringh_init_iomem - initialize a vringh for a vring on io-memory.
>   1650	 * @vrh: the vringh to initialize.
>   1651	 * @features: the feature bits for this ring.
>   1652	 * @num: the number of elements.
>   1653	 * @weak_barriers: true if we only need memory barriers, not I/O.
>   1654	 * @desc: the userspace descriptor pointer.
>   1655	 * @avail: the userspace avail pointer.
>   1656	 * @used: the userspace used pointer.
>   1657	 *
>   1658	 * Returns an error if num is invalid: you should check pointers
>   1659	 * yourself!
>   1660	 */
> > 1661	int vringh_init_iomem(struct vringh *vrh, u64 features, unsigned int num,
>   1662			      bool weak_barriers, struct vring_desc *desc,
>   1663			      struct vring_avail *avail, struct vring_used *used)
>   1664	{
>   1665		return vringh_init_kern(vrh, features, num, weak_barriers, desc, avail,
>   1666					used);
>   1667	}
>   1668	EXPORT_SYMBOL(vringh_init_iomem);
>   1669	
>   1670	/**
>   1671	 * vringh_getdesc_iomem - get next available descriptor from vring on io-memory.
>   1672	 * @vrh: the vring on io-memory.
>   1673	 * @riov: where to put the readable descriptors (or NULL)
>   1674	 * @wiov: where to put the writable descriptors (or NULL)
>   1675	 * @head: head index we received, for passing to vringh_complete_iomem().
>   1676	 * @gfp: flags for allocating larger riov/wiov.
>   1677	 *
>   1678	 * Returns 0 if there was no descriptor, 1 if there was, or -errno.
>   1679	 *
>   1680	 * There some notes, and those are same with vringh_getdesc_kern(). Please see
>   1681	 * it.
>   1682	 */
> > 1683	int vringh_getdesc_iomem(struct vringh *vrh, struct vringh_kiov *riov,
>   1684				 struct vringh_kiov *wiov, u16 *head, gfp_t gfp)
>   1685	{
>   1686		int err;
>   1687	
>   1688		err = __vringh_get_head(vrh, getu16_iomem, &vrh->last_avail_idx);
>   1689		if (err < 0)
>   1690			return err;
>   1691	
>   1692		/* Empty... */
>   1693		if (err == vrh->vring.num)
>   1694			return 0;
>   1695	
>   1696		*head = err;
>   1697		err = __vringh_iov(vrh, *head, riov, wiov, no_range_check, NULL, gfp,
>   1698				   copydesc_iomem);
>   1699		if (err)
>   1700			return err;
>   1701	
>   1702		return 1;
>   1703	}
>   1704	EXPORT_SYMBOL(vringh_getdesc_iomem);
>   1705	
>   1706	/**
>   1707	 * vringh_iov_pull_iomem - copy bytes from vring_iov.
>   1708	 * @riov: the riov as passed to vringh_getdesc_iomem() (updated as we consume)
>   1709	 * @dst: the place to copy.
>   1710	 * @len: the maximum length to copy.
>   1711	 *
>   1712	 * Returns the bytes copied <= len or a negative errno.
>   1713	 */
> > 1714	ssize_t vringh_iov_pull_iomem(struct vringh *vrh, struct vringh_kiov *riov,
>   1715				      void *dst, size_t len)
>   1716	{
>   1717		return vringh_iov_xfer(vrh, riov, dst, len, xfer_from_iomem);
>   1718	}
>   1719	EXPORT_SYMBOL(vringh_iov_pull_iomem);
>   1720	
>   1721	/**
>   1722	 * vringh_iov_push_iomem - copy bytes into vring_iov.
>   1723	 * @wiov: the wiov as passed to vringh_getdesc_iomem() (updated as we consume)
>   1724	 * @src: the place to copy from.
>   1725	 * @len: the maximum length to copy.
>   1726	 *
>   1727	 * Returns the bytes copied <= len or a negative errno.
>   1728	 */
> > 1729	ssize_t vringh_iov_push_iomem(struct vringh *vrh, struct vringh_kiov *wiov,
>   1730				      const void *src, size_t len)
>   1731	{
>   1732		return vringh_iov_xfer(vrh, wiov, (void *)src, len, xfer_to_iomem);
>   1733	}
>   1734	EXPORT_SYMBOL(vringh_iov_push_iomem);
>   1735	
>   1736	/**
>   1737	 * vringh_abandon_iomem - we've decided not to handle the descriptor(s).
>   1738	 * @vrh: the vring.
>   1739	 * @num: the number of descriptors to put back (ie. num
>   1740	 *	 vringh_getdesc_iomem() to undo).
>   1741	 *
>   1742	 * The next vringh_get_kern() will return the old descriptor(s) again.
>   1743	 */
> > 1744	void vringh_abandon_iomem(struct vringh *vrh, unsigned int num)
>   1745	{
>   1746		vringh_abandon_kern(vrh, num);
>   1747	}
>   1748	EXPORT_SYMBOL(vringh_abandon_iomem);
>   1749	
>   1750	/**
>   1751	 * vringh_complete_iomem - we've finished with descriptor, publish it.
>   1752	 * @vrh: the vring.
>   1753	 * @head: the head as filled in by vringh_getdesc_iomem().
>   1754	 * @len: the length of data we have written.
>   1755	 *
>   1756	 * You should check vringh_need_notify_iomem() after one or more calls
>   1757	 * to this function.
>   1758	 */
> > 1759	int vringh_complete_iomem(struct vringh *vrh, u16 head, u32 len)
>   1760	{
>   1761		struct vring_used_elem used;
>   1762	
>   1763		used.id = cpu_to_vringh32(vrh, head);
>   1764		used.len = cpu_to_vringh32(vrh, len);
>   1765	
>   1766		return __vringh_complete(vrh, &used, 1, putu16_iomem, putused_iomem);
>   1767	}
>   1768	EXPORT_SYMBOL(vringh_complete_iomem);
>   1769	
>   1770	/**
>   1771	 * vringh_notify_enable_iomem - we want to know if something changes.
>   1772	 * @vrh: the vring.
>   1773	 *
>   1774	 * This always enables notifications, but returns false if there are
>   1775	 * now more buffers available in the vring.
>   1776	 */
> > 1777	bool vringh_notify_enable_iomem(struct vringh *vrh)
>   1778	{
>   1779		return __vringh_notify_enable(vrh, getu16_iomem, putu16_iomem);
>   1780	}
>   1781	EXPORT_SYMBOL(vringh_notify_enable_iomem);
>   1782	
>   1783	/**
>   1784	 * vringh_notify_disable_iomem - don't tell us if something changes.
>   1785	 * @vrh: the vring.
>   1786	 *
>   1787	 * This is our normal running state: we disable and then only enable when
>   1788	 * we're going to sleep.
>   1789	 */
> > 1790	void vringh_notify_disable_iomem(struct vringh *vrh)
>   1791	{
>   1792		__vringh_notify_disable(vrh, putu16_iomem);
>   1793	}
>   1794	EXPORT_SYMBOL(vringh_notify_disable_iomem);
>   1795	
>   1796	/**
>   1797	 * vringh_need_notify_iomem - must we tell the other side about used buffers?
>   1798	 * @vrh: the vring we've called vringh_complete_iomem() on.
>   1799	 *
>   1800	 * Returns -errno or 0 if we don't need to tell the other side, 1 if we do.
>   1801	 */
> > 1802	int vringh_need_notify_iomem(struct vringh *vrh)
>   1803	{
>   1804		return __vringh_need_notify(vrh, getu16_iomem);
>   1805	}
>   1806	EXPORT_SYMBOL(vringh_need_notify_iomem);
>   1807	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
